////////////////////////////////////////////////////////////////////////////////
//   ____  ____   
//  /   /\/   /  
// /___/  \  /   
// \   \   \/  
//  \   \        Copyright (c) 2003-2004 Xilinx, Inc.
//  /   /        All Right Reserved. 
// /---/   /\     
// \   \  /  \  
//  \___\/\___\
////////////////////////////////////////////////////////////////////////////////

#ifndef H_Work_mux_rtl1_rtl1_H
#define H_Work_mux_rtl1_rtl1_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_mux_rtl1_rtl1: public HSim__s6 {
public:

    HSim__s1 SE[3];

    Work_mux_rtl1_rtl1(const char * name);
    ~Work_mux_rtl1_rtl1();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_mux_rtl1_rtl1(const char *name);

#endif
