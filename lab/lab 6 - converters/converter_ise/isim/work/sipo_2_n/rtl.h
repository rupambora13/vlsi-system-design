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

#ifndef H_Work_sipo_2_n_rtl_H
#define H_Work_sipo_2_n_rtl_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_sipo_2_n_rtl: public HSim__s6 {
public:

    HSim__s1 SE[6];

    HSim__s1 SA[2];
    Work_sipo_2_n_rtl(const char * name);
    ~Work_sipo_2_n_rtl();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_sipo_2_n_rtl(const char *name);

#endif
