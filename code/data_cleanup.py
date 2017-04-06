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
    imagenet_source_folder = images_folder + "/imagenet"

    # create the destination folder if it doesn't exist
    if not os.path.exists(destination_folder):
        os.mkdir(destination_folder)    

    # cleanup datasets
    cleanup_vais(vais_source_folder, destination_folder)
    cleanup_imagenet(imagenet_source_folder, destination_folder)


def cleanup_vais(source_folder, dest_folder):
    """cleans up the VAIS dataset"""
    index = 0
    for root, dirs, files in os.walk(source_folder):
        for file in files:
            if ".png" in file and "-eo_" in file:
                new_name = "ship_vais_" + str(index) + ".png"
                new_path = os.path.join(dest_folder, new_name)
                old_path = os.path.join(root, file)
                os.rename(old_path, new_path)
                print("moved " + old_path + " to " + new_path)
                index += 1


def cleanup_imagenet(source_folder, dest_folder):
    """cleans up the imagenet images"""
    index = 0
    for root, dirs, files in os.walk(source_folder):
        path_parts = os.path.split(root)
        label = path_parts[1]
        print("label = " + label)
        for file in files:
            extension = file.split(".")[-1]
            extension = extension.lower()
            if "jpg" in extension or "jpeg" in extension:
                new_name = label + "_imagenet_" + str(index) + "." + extension
                new_path = os.path.join(dest_folder, new_name)
                old_path = os.path.join(root, file)
                os.rename(old_path, new_path)
                print("moved %s to %s" % (old_path, new_path))
                index += 1


if __name__ == "__main__":
    main()
