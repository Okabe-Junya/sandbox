# ns3-gym セットアップメモ

## 要点

- ns3-gym のビルドを行う際は，Python3.10.xまでのバージョンを使用する
- devcontainer でのビルドを行う場合は，`devcontainer.json` の `postCreateCommand` に以下を追加する

## 前提

dev-container で [ns3-gymのREADME](https://github.com/tsukuba-websci/ns3-gym/blob/master/README.md) の通りにセットアップを行うと，`./waf build` に失敗する．これはそもそも `./waf configure --enable-examples` で以下のようなライブラリ，ツールがインストールされていないためである．

```bash
vscode ➜ /workspaces/ubuntu/ns3-gym (master) $ ./waf configure --enable-examples --enable-tests | grep not | grep -v grep
Checking boost includes                                : headers not found, please provide a --boost-includes argument (see help)
Checking boost includes                                : headers not found, please provide a --boost-includes argument (see help)
Checking for click location                            : not found
Checking for program 'pkg-config'                      : not found
Checking for program 'pkg-config'                      : not found
checking for uint128_t                                 : not found
Checking for header sys/inttypes.h                     : not found
Checking for header sys/inttypes.h                     : not found
Checking for NSC location                              : not found
Checking for program 'pkg-config'                      : not found
Checking for program 'valgrind'                        : not found
Checking for program 'pkg-config'                      : not found
python-config                                          : not found
Checking for program 'doxygen'                          : not found
BRITE Integration             : not enabled (BRITE not enabled (see option --with-brite))
DES Metrics event collection  : not enabled (defaults to disabled)
GNU Scientific Library (GSL)  : not enabled (GSL not found)
Gcrypt library                : not enabled (libgcrypt not found: you can use libgcrypt-config to find its location.)
GtkConfigStore                : not enabled (library 'gtk+-3.0 >= 3.0' not found)
MPI Support                   : not enabled (option --enable-mpi not selected)
NS-3 Click Integration        : not enabled (nsclick not enabled (see option --with-nsclick))
NS-3 OpenFlow Integration     : not enabled (Required boost libraries not found)
Network Simulation Cradle     : not enabled (NSC not found (see option --with-nsc))
PlanetLab FdNetDevice         : not enabled (PlanetLab operating system not detected (see option --force-planetlab))
PyViz visualizer              : not enabled (Python Bindings are needed but not enabled)
Python Bindings               : not enabled (The python found version is too low (2.3 required))
SQlite stats data output      : not enabled (library 'sqlite3' not found)
Use sudo to set suid bit      : not enabled (option --enable-sudo not selected)
XmlIo                         : not enabled (library 'libxml-2.0 >= 2.7' not found)
```

（もしかしたら，上記のようなエラーに加え，`Python not found` のようなエラーが出るかもしれない．これは大抵の場合，`python` が `python3` にリンクされていないことが原因である．symlink を張るか，Python処理系をよしなに導入することで解決できる．）

```bash
Erroneous order constraint 'after'='link' on task class 'SuidBuild_task'
Erroneous order constraint 'after'='link' on task class 'print_introspected_doxygen_task'
Erroneous order constraint 'after'='link' on task class 'run_python_unit_tests_task'
...
Build failed
 -> task in 'ns3-opengym' failed with exit status 1:
        {task 281473007124288: cxx opengym_interface.cc -> opengym_interface.cc.1.o}
['/usr/bin/g++', '-O0', '-ggdb', '-g3', '-Wall', '-Werror', '-std=c++11', '-fstrict-aliasing', '-Wstrict-aliasing', '-fPIC', '-pthread', '-I.', '-I..', '-DNS3_BUILD_PROFILE_DEBUG', '-DNS3_ASSERT_ENABLE', '-DNS3_LOG_ENABLE', '-DHAVE_SYS_IOCTL_H=1', '-DHAVE_IF_NETS_H=1', '-DHAVE_NET_ETHERNET_H=1', '-DHAVE_PACKET_H=1', '-DHAVE_ZMQ=1', '-DHAVE_PROTOBUF=1', '-DHAVE_IF_TUN_H=1', '../src/opengym/model/opengym_interface.cc', '-c', '-o/workspaces/ubuntu/ns3-gym/build/src/opengym/model/opengym_interface.cc.1.o']
```
