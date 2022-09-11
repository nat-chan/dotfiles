#!/bin/bash
tar -I "pxz -e9" -cf "${1}.txz" "${1}" && rm -rf "${1}"%
