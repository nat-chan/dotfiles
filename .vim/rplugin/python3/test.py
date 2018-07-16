#!/usr/bin/env python
# coding:utf-8
import neovim
import os
import sys
import numpy
import libsixel
import mypy

@neovim.plugin
class Test(object):
	def __init__(self, vim):
		self.vim = vim

	@neovim.function('Test')
	def doItPython(self, args):
		self.vim.command('echo "hello from Test!"')

