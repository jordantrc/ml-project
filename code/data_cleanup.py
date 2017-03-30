#!/usr/bin/env python3
#
# Project: CS 880 (ML) Project
# Author: Jordan Chadwick (jordan@wickwick.org)
# File: data_cleanup.py
#
# This script cleans up the various datasets for this
# project.
#

import os


def main():
    """main function"""
    # paths to datasets are relative to this script
    images_folder = "../images"
    destination_folder = images_folder + "/combined"
    vais_source_folder = images_folder + "/VAIS"

    # cleanup VAIS dataset
    cleanup_vais(vais_source_folder, destination_folder)


def cleanup_vais(source_folder, dest_folder):
    """cleans up the VAIS dataset"""
    index = 0
    for root, dirs, files in os.walk(source_folder):
        for file in files:
            if ".png" in file and "-eo_" in file:
                new_name = "ship_vais_" + str(index) + ".png"
                os.rename(root + "/" + file, dest_folder + "/" + new_name)
                print("moved " + root + "/" + file + " to " + dest_folder + "/" + new_name)
                index += 1


if __name__ == "__main__":
    main()
