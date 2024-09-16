project('url-info', 'cpp',
  version : '0.1',
  default_options : ['warning_level=3',
                     'cpp_std=c++20',
                     'warning_level=2',
                     'buildtype=release'])

ada = dependency('ada', version: '>=2.9.2', method : 'cmake')
boost = dependency('boost')
src = ['url-info.cpp']

exe = executable('url-info', src,
  dependencies: [ada, boost],
  install : true)
