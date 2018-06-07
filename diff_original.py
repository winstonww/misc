#!/usr/bin/env python
import sys
import argparse
import os
import subprocess
from shutil import copyfile

if __name__ == '__main__':
  parser = argparse.ArgumentParser(description='diff workspace file from PerForce repo applying a4 diff with vim. needs to be run in the container')
  parser.add_argument('-f', "--file_path", type=str, required=True,
                        help='enter the path of the workspace file')

  parser.add_argument('-p',"--diff_parent", help='diff against parent', action="store_true")
  args = parser.parse_args()

  ws_path = os.path.abspath( args.file_path )
  tmp_ws_path = "/tmp/{0}".format( os.path.basename( ws_path ) )

  tmp_original_path = "/tmp/{0}_original{1}".format( os.path.splitext( os.path.basename( ws_path ))[0] , 
      os.path.splitext( os.path.basename( ws_path ))[1] )

  tmp_patch_path = "/tmp/{0}.patch".format( os.path.splitext( os.path.basename( ws_path ) )[0] )

  copyfile( ws_path , tmp_ws_path )

  with open( tmp_patch_path , "w" ) as patch_fh:
    try:
      if args.diff_parent:
         subprocess.check_call( ["a4", "project", "diff",  ws_path ] , stdout=patch_fh )
      else:
         subprocess.check_call( ["a4", "diff",  ws_path ] , stdout=patch_fh )
    except subprocess.CalledProcessError:
      sys.exit("cannot obtain diff patch, exiting")

  with open( tmp_patch_path, "r") as patch_fh:
    # change to root dir to apply patch
    os.chdir( "/" )
    try:
      subprocess.check_call( ["patch","-p0", "-R"], stdin=patch_fh )
    except subprocess.CalledProcessError:
      sys.exit("cannot apply diff patch, exiting")
    # copy patched file to tmp
    copyfile( ws_path , tmp_original_path )
    copyfile( tmp_ws_path , ws_path )

  # Open vim
  subprocess.call( ["vimdiff", ws_path, tmp_original_path])
