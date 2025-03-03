cmake_minimum_required(VERSION 3.0)
project(ragel CXX)

find_program(NMAKE nmake)

file(GLOB HEADERS
	ragel/buffer.h
	ragel/cdgoto.h
	ragel/cscodegen.h
	ragel/csipgoto.h
	ragel/inputdata.h
	ragel/rbxgoto.h
	ragel/rubyflat.h
	ragel/cdcodegen.h
	ragel/cdipgoto.h
	ragel/csfflat.h
	ragel/cssplit.h
	ragel/javacodegen.h
	ragel/redfsm.h
	ragel/rubyftable.h
	ragel/cdfflat.h
	ragel/cdsplit.h
	ragel/csfgoto.h
	ragel/cstable.h
	ragel/parsedata.h
	ragel/rlparse.h
	ragel/rubytable.h
	ragel/cdfgoto.h
	ragel/cdtable.h
	ragel/csflat.h
	ragel/dotcodegen.h
	ragel/parsetree.h
	ragel/rlscan.h
	ragel/version.h
	ragel/cdflat.h
	ragel/common.h
	ragel/csftable.h
	ragel/fsmgraph.h
	ragel/pcheck.h
	ragel/rubycodegen.h
	ragel/xmlcodegen.h
	ragel/cdftable.h
	ragel/csgoto.h
	ragel/gendata.h
	ragel/ragel.h
	ragel/rubyfflat.h
	ragel/gocodegen.h
	ragel/gotable.h
	ragel/goftable.h
	ragel/goflat.h
	ragel/gofflat.h
	ragel/gogoto.h
	ragel/gofgoto.h
	ragel/goipgoto.h
	ragel/gotablish.h
	ragel/mlcodegen.h
	ragel/mltable.h
	ragel/mlftable.h
	ragel/mlflat.h
	ragel/mlfflat.h
	ragel/mlgoto.h
	ragel/mlfgoto.h
)

file(GLOB SRC
	ragel/main.cpp
	ragel/parsetree.cpp
	ragel/parsedata.cpp
	ragel/fsmstate.cpp
	ragel/fsmbase.cpp
	ragel/fsmattach.cpp
	ragel/fsmmin.cpp
	ragel/fsmgraph.cpp
	ragel/fsmap.cpp
	ragel/rlscan.cpp
	ragel/rlparse.cpp
	ragel/inputdata.cpp
	ragel/common.cpp
	ragel/redfsm.cpp
	ragel/gendata.cpp
	ragel/cdcodegen.cpp
	ragel/cdtable.cpp
	ragel/cdftable.cpp
	ragel/cdflat.cpp
	ragel/cdfflat.cpp
	ragel/cdgoto.cpp
	ragel/cdfgoto.cpp
	ragel/cdipgoto.cpp
	ragel/cdsplit.cpp
	ragel/javacodegen.cpp
	ragel/rubycodegen.cpp
	ragel/rubytable.cpp
	ragel/rubyftable.cpp
	ragel/rubyflat.cpp
	ragel/rubyfflat.cpp
	ragel/rbxgoto.cpp
	ragel/cscodegen.cpp
	ragel/cstable.cpp
	ragel/csftable.cpp
	ragel/csflat.cpp
	ragel/csfflat.cpp
	ragel/csgoto.cpp
	ragel/csfgoto.cpp
	ragel/csipgoto.cpp
	ragel/cssplit.cpp
	ragel/dotcodegen.cpp
	ragel/xmlcodegen.cpp
	ragel/gocodegen.cpp
	ragel/gotable.cpp
	ragel/goftable.cpp
	ragel/goflat.cpp
	ragel/gofflat.cpp
	ragel/gogoto.cpp
	ragel/gofgoto.cpp
	ragel/goipgoto.cpp
	ragel/gotablish.cpp
	ragel/mlcodegen.cpp
	ragel/mltable.cpp
	ragel/mlftable.cpp
	ragel/mlflat.cpp
	ragel/mlfflat.cpp
	ragel/mlgoto.cpp
	ragel/mlfgoto.cpp
)

include_directories(aapl)

add_executable(ragel ${SRC})

install(TARGETS ragel DESTINATION tools)
install(FILES ${HEADERS} DESTINATION include)
