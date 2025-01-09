/*
* Copyright (c) 2024 Beijing Institute of Open Source Chip
* OpenNoC is licensed under Mulan PSL v2.
* You can use this software according to the terms and conditions of the Mulan PSL v2.
* You may obtain a copy of Mulan PSL v2 at:
*          http://license.coscl.org.cn/MulanPSL2
* THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
* EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
* MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
* See the Mulan PSL v2 for more details.
*
* Author:
*    Li Zhao <lizhao@bosc.ac.cn>
*    Nana Cai <cainana@bosc.ac.cn>
*    Chunyan Lin <linchunyan@bosc.ac.cn>
*    Xiaotian Cao <caoxiaotian@bosc.ac.cn>
*/

`ifndef HNI_DEFINES
`define HNI_DEFINES

`include "chie_defines.v"

//global define
`define HNI0_ID                            HNI_NODEID_PARAM

`define HNI_MSHR_ENTRIES_NUM               HNI_MSHR_ENTRIES_NUM_PARAM
`define HNI_MSHR_ENTRIES_WIDTH             HNI_MSHR_ENTRIES_WIDTH_PARAM
`define HNI_AXI4_AXID_WIDTH                11
`define HNI_AXI4_AXADDR_WIDTH              AXI4_PA_WIDTH_PARAM

//hni_dbf
`define HNI_MASK_CD_WIDTH 4 
`define HNI_MASK_CD_LSB 0 
`define HNI_MASK_CD_MSB 3 
`define HNI_MASK_CD_RANGE 3:0 
`define HNI_MASK_WL_WIDTH 4 
`define HNI_MASK_WL_LSB 0 
`define HNI_MASK_WL_MSB 3 
`define HNI_MASK_WL_RANGE 3:0
`define HNI_MASK_RD_WIDTH 4 
`define HNI_MASK_RD_LSB 0 
`define HNI_MASK_RD_MSB 3 
`define HNI_MASK_RD_RANGE 3:0 
`define HNI_MASK_PD_WIDTH 4 
`define HNI_MASK_PD_LSB 0 
`define HNI_MASK_PD_MSB 3 
`define HNI_MASK_PD_RANGE 3:0

//hni_link_req_channel_lcredit
`define HNI_LL_REQ_CRD_CNT_WIDTH           4
`define HNI_LL_REQ_CRD_CNT_RANGE           3:0
`define HNI_LL_REQ_CRD_CNT_MSB             3
`define HNI_LL_REQ_CRD_CNT_LSB             0
`define HNI_LL_REQ_MAX_CRD_VALUE           XP_LCRD_NUM_PARAM
`define HNI_LL_CRD_INCDEC_ONE              1
`define HNI_LL_CRD_INCDEC_TWO              2
`define HNI_LL_CRD_INCDEC_THREE            3

//hni_link_rsp_channel_lcredit
`define HNI_LL_RSP_CRD_CNT_WIDTH           4
`define HNI_LL_RSP_CRD_CNT_RANGE           3:0
`define HNI_LL_RSP_CRD_CNT_MSB             3
`define HNI_LL_RSP_CRD_CNT_LSB             0
`define HNI_LL_RSP_MAX_CRD_VALUE           XP_LCRD_NUM_PARAM

//hni_link_dat_channel_lcredit
`define HNI_LL_DAT_CRD_CNT_WIDTH           4
`define HNI_LL_DAT_CRD_CNT_RANGE           3:0
`define HNI_LL_DAT_CRD_CNT_MSB             3
`define HNI_LL_DAT_CRD_CNT_LSB             0
`define HNI_LL_DAT_MAX_CRD_VALUE           XP_LCRD_NUM_PARAM

//hni_mshr_qos
`define HNI_QOS_CNT_WIDTH                      HNI_MSHR_ENTRIES_WIDTH_PARAM
`define HNI_QOS_CLASS_WIDTH                    1
`define HNI_QOS_CLASS_HIGH                     1
`define HNI_QOS_CLASS_LOW                      0
`define HNI_QOS_HIGH_MAX                       15
`define HNI_QOS_HIGH_MIN                       8
`define HNI_QOS_LOW_MAX                        7
`define HNI_QOS_LOW_MIN                        0
`define HNI_QOS_HIGH_POOL_NUM                  HNI_MSHR_ENTRIES_NUM_PARAM/2
`define HNI_QOS_LOW_POOL_NUM                   HNI_MSHR_ENTRIES_NUM_PARAM/2
`define HNI_RET_BANK_CNT_WIDTH                 10
`define HNI_RET_BANK_ENTRIES_NUM               HNI_MSHR_RNF_NUM_PARAM
`define HNI_RET_BANK_ENTRIES_WIDTH             ((HNI_MSHR_RNF_NUM_PARAM > 1) ? $clog2(HNI_MSHR_RNF_NUM_PARAM) : 1)
`define HNI_MAX_WAIT_CNT_WIDTH                 4
`define HNI_LOW2HIGH_MAX_CNT                   10
`define HNI_RETRY_ACKQ_DATA_DEPTH              15
`define HNI_RETRY_ACKQ_DATA_WIDTH              `CHIE_REQ_FLIT_SRCID_WIDTH+`CHIE_REQ_FLIT_TXNID_WIDTH+`CHIE_REQ_FLIT_QOS_WIDTH+`CHIE_REQ_FLIT_TRACETAG_WIDTH+`CHIE_REQ_FLIT_PCRDTYPE_WIDTH
`define HNI_RETRY_ACKQ_DATA_RANGE              `CHIE_REQ_FLIT_SRCID_WIDTH+`CHIE_REQ_FLIT_TXNID_WIDTH+`CHIE_REQ_FLIT_QOS_WIDTH+`CHIE_REQ_FLIT_TRACETAG_WIDTH+`CHIE_REQ_FLIT_PCRDTYPE_WIDTH-1:0
`define HNI_RETRY_ACKQ_SRCID_RANGE             `CHIE_REQ_FLIT_SRCID_WIDTH-1:0
`define HNI_RETRY_ACKQ_TXNID_RANGE             `CHIE_REQ_FLIT_TXNID_WIDTH+`CHIE_REQ_FLIT_SRCID_WIDTH-1:`CHIE_REQ_FLIT_SRCID_WIDTH
`define HNI_RETRY_ACKQ_QOS_RANGE               `CHIE_REQ_FLIT_QOS_WIDTH+`CHIE_REQ_FLIT_TXNID_WIDTH+`CHIE_REQ_FLIT_SRCID_WIDTH-1:`CHIE_REQ_FLIT_TXNID_WIDTH+`CHIE_REQ_FLIT_SRCID_WIDTH
`define HNI_RETRY_ACKQ_TRACE_RANGE             `CHIE_REQ_FLIT_TRACETAG_WIDTH+`CHIE_REQ_FLIT_QOS_WIDTH+`CHIE_REQ_FLIT_TXNID_WIDTH+`CHIE_REQ_FLIT_SRCID_WIDTH-1:`CHIE_REQ_FLIT_QOS_WIDTH+`CHIE_REQ_FLIT_TXNID_WIDTH+`CHIE_REQ_FLIT_SRCID_WIDTH
`define HNI_RETRY_ACKQ_PCRDTYPE_RANGE          `CHIE_REQ_FLIT_PCRDTYPE_WIDTH+`CHIE_REQ_FLIT_TRACETAG_WIDTH+`CHIE_REQ_FLIT_QOS_WIDTH+`CHIE_REQ_FLIT_TXNID_WIDTH+`CHIE_REQ_FLIT_SRCID_WIDTH-1:`CHIE_REQ_FLIT_TRACETAG_WIDTH+`CHIE_REQ_FLIT_QOS_WIDTH+`CHIE_REQ_FLIT_TXNID_WIDTH+`CHIE_REQ_FLIT_SRCID_WIDTH
`define HNI_PCRDGRANTQ_DATA_DEPTH              31
`define HNI_PCRDGRANTQ_DATA_WIDTH              `CHIE_REQ_FLIT_SRCID_WIDTH+`CHIE_REQ_FLIT_QOS_WIDTH+`CHIE_REQ_FLIT_PCRDTYPE_WIDTH
`define HNI_PCRDGRANTQ_DATA_RANGE              `CHIE_REQ_FLIT_SRCID_WIDTH+`CHIE_REQ_FLIT_QOS_WIDTH+`CHIE_REQ_FLIT_PCRDTYPE_WIDTH-1:0
`define HNI_PCRDGRANTQ_SRCID_RANGE             `CHIE_REQ_FLIT_SRCID_WIDTH-1:0
`define HNI_PCRDGRANTQ_QOS_RANGE               `CHIE_REQ_FLIT_QOS_WIDTH+`CHIE_REQ_FLIT_SRCID_WIDTH-1:`CHIE_REQ_FLIT_SRCID_WIDTH
`define HNI_PCRDGRANTQ_PCRDTYPE_RANGE          `CHIE_REQ_FLIT_PCRDTYPE_WIDTH+`CHIE_REQ_FLIT_QOS_WIDTH+`CHIE_REQ_FLIT_SRCID_WIDTH-1:`CHIE_REQ_FLIT_QOS_WIDTH+`CHIE_REQ_FLIT_SRCID_WIDTH

`endif
