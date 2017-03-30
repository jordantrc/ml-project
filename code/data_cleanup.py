#!/usr/bin/env python3
#
# Project: CS 880 (ML) Project
# Author: Jordan Chadwick (jordan@wickwick.org)
# File: data_cleanup.py
#
# This script cleans up the various datasets for this
# project.
#


def main():
    """main function"""
    # paths to datasets are relative to this script
    images_folder = "../images"
    vais_source_folder = images_folder + "/VAIS-original"

    cleanup_vais(vais_source_folder)


def cleanup_vais(folder):
    """cleans up the VAIS dataset"""



if __name__ == "__main__":
    main()
