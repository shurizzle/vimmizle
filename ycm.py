import vim

def FlagsForFile(filename):
  filetype = vim.eval("&filetype")

  if filetype == "c":
    flags = ['-xc', '-Wall', '-Wextra'] + vim.eval("g:syntastic_c_compiler_options").split(' ')
  elif filetype == "cpp":
    flags = ['-xc++', '-Wall', '-Wextra'] + vim.eval("g:syntastic_cpp_compiler_options").split(' ')
  else:
    flags = []

  return {
    'flags':    flags,
    'do_cache': True
  }
