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

#ifndef H_Work_ha_rtl_dataflow_H
#define H_Work_ha_rtl_dataflow_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_ha_rtl_dataflow: public HSim__s6 {
public:

    HSim__s1 SE[4];

  char t0;
    Work_ha_rtl_dataflow(const char * name);
    ~Work_ha_rtl_dataflow();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_ha_rtl_dataflow(const char *name);

#endif
