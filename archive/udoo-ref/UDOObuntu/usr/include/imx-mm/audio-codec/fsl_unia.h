
/***********************************************************************
 * Copyright (c) 2011-2014, Freescale Semiconductor, Inc.
 * All modifications are confidential and proprietary information
 * of Freescale Semiconductor, Inc. ALL RIGHTS RESERVED.
 ***********************************************************************/

/*
 *
 *  History :
 *  Date             Author              Version    Description
 *
 *  Sep, 2011        Lyon               1.0        Initial Version
 *
 */

#ifndef _Uni_ADEC_WRAPPER_H_
#define _Uni_ADEC_WRAPPER_H_

#include "fsl_types.h"


#ifdef __cplusplus
#define EXTERN extern "C"
#else
#define EXTERN
#endif


/* Warning:
 * It's not recommended to use any enum types as API arguments or return value!
 * Please use data types that can explicitly tell the data length and asign them the listed enum values.
 * It's because different compilers can treat enum as different types such as integer or unsinged char.
 * If the ACodec library and plug-in(filter) are built by different compliers, the data length mismatch
 * will cause error.
 */
 typedef void * UniACodec_Handle;
//typedef void * UniACodec_Config;
//typedef void * UniACodec_Info;

/*
 * Common error codes of ACodec,
 * within the range [-100 , +100].
 * Different ACodecs can extend the format specific errors OUTSIDE this range,
 * in their own API header files.
 */
typedef enum
{
    ACODEC_SUCCESS = 0,
      
    ACODEC_ERROR_STREAM,
    ACODEC_PARA_ERROR,
    ACODEC_INSUFFICIENT_MEM,
    ACODEC_ERR_UNKNOWN,
    ACODEC_PROFILE_NOT_SUPPORT,
    ACODEC_INIT_ERR,
    ACODEC_NO_OUTPUT,
    
    ACODEC_NOT_ENOUGH_DATA = 0x100,
    ACODEC_CAPIBILITY_CHANGE = 0x200, /* output format changes, caller should reget format from getparameter API */
    ACODEC_END_OF_STREAM = 0x300, /* no output */
} UA_ERROR_TYPE;


/* Parameter type to Set /Get */
typedef enum
{
/* Set parmameters */
/* common  */
    UNIA_SAMPLERATE= 0,
    UNIA_CHANNEL,
    UNIA_FRAMED,        /* one whole frame input */
    UNIA_DEPTH,
    UNIA_CODEC_DATA,
    UNIA_BITRATE,
    UNIA_DOWNMIX_STEREO,
    UNIA_STREAM_TYPE,
    UNIA_CHAN_MAP_TABLE,
    //UNIA_CHANNEL_MASK,
    
/* dedicate for wma */
    UNIA_WMA_BlOCKALIGN= 0x100,
    UNIA_WMA_VERSION,

/*dedicate for RealAudio */
    UNIA_RA_FLAVOR_INDEX = 0x110,
    UNIA_RA_FRAME_BITS,
    
/* Get parmameters */
    UNIA_CODEC_DESCRIPTION= 0x200, 
    UNIA_OUTPUT_PCM_FORMAT,
    UNIA_CONSUMED_LENGTH,
    UNIA_OUTBUF_ALLOC_SIZE,  /* used for allocate output buffer outside */
    
    UA_TYPE_MAX
} UA_ParaType;



typedef enum
{
  UA_CHANNEL_FRONT_MONO,
  UA_CHANNEL_FRONT_LEFT,
  UA_CHANNEL_FRONT_RIGHT,
  
  UA_CHANNEL_REAR_CENTER,
  UA_CHANNEL_REAR_LEFT,
  UA_CHANNEL_REAR_RIGHT,

  UA_CHANNEL_LFE,

  UA_CHANNEL_FRONT_CENTER,
  UA_CHANNEL_FRONT_LEFT_CENTER,
  UA_CHANNEL_FRONT_RIGHT_CENTER,

  UA_CHANNEL_SIDE_LEFT,
  UA_CHANNEL_SIDE_RIGHT,

  UA_CHANNEL_MAX
  
}UA_CHANNEL_LAYOUT;

#define STREAM_NBAMR_BASE  0x10
#define STREAM_WBAMR_BASE  0x20
typedef enum
{
    /* AAC/AACPLUS file format */
    STREAM_UNKNOW = 0,
    STREAM_ADTS,
    STREAM_ADIF,
    STREAM_RAW,  

    /* NB-AMR file format */
    STREAM_NBAMR_ETSI = STREAM_NBAMR_BASE,
    STREAM_NBAMR_MMSIO,
    STREAM_NBAMR_IF1IO,
    STREAM_NBAMR_IF2IO,

    /* WB-AMR file format */
    STREAM_WBAMR_DEFT = STREAM_WBAMR_BASE,
    STREAM_WBAMR_ITU,
    STREAM_WBAMR_MIME,
    STREAM_WBAMR_IF2,
    STREAM_WBAMR_IF1,

} STREAM_TYPE;

/*********************************************************************
 * Uni Audio memory callback funtion pointer table.
 *********************************************************************/
typedef struct
{
    void* (*Calloc) (uint32 numElements, uint32 size);
    void* (*Malloc) (uint32 size);
    void  (*Free) (void * ptr);
    void* (*ReAlloc)(void * ptr, uint32 size);
}UniACodecMemoryOps; /* callback operation callback table */

typedef struct
{
  uint32 samplerate;
  uint32 width;
  uint32 depth;
  uint32 channels;
  uint32 endian;
  bool interleave;
  uint32 layout[UA_CHANNEL_MAX];
  bool chan_pos_set;  // indicate if channel position is set outside or use codec default
}UniAcodecOutputPCMFormat;


typedef struct 
{
     uint32 size;		/* The size in bytes of the data in this buffer */
     char * buf;		/* Buffer pointer */
}UniACodecParameterBuffer;

typedef struct
{   uint32 size;
    uint32* channel_table[10]; //assume the max channel is less than 10
}CHAN_TABLE;

typedef struct
{
#if !defined(RVDS)
    union {
#endif
        uint32 samplerate;
        uint32 channels;
        uint32 bitrate;
        uint32 depth;
        uint32 blockalign;
        uint32 version;
        bool downmix;
        bool framed;
        UniACodecParameterBuffer codecData;
        STREAM_TYPE stream_type;
        CHAN_TABLE chan_map_tab;

        /* for real audio decoder */
        uint32 frame_bits;
        uint32 flavor_index;
		
        char ** codecDesc;
        UniAcodecOutputPCMFormat outputFormat;
        uint32 consumed_length;
        uint32 outbuf_alloc_size;
#if !defined(RVDS)        
    };
#endif
}UniACodecParameter;


/* typedef struct
{
    uint32 (*wma10dec_callback) (void *state, uint64 offset, uint32 * num_bytes, uint8 **ppData, void* pAppContext, uint32 *compress_payload);

}UniACodecCallbackOps;
*/
/*********************************************************************************************************
 *                  API Funtion Prototypes List
 *
 * There are mandotory and optional APIs.
 * A core wrapper must implent the mandory APIs while need not implement the optional one.
 * And in its DLL entry point "UniACodecInit", it shall set the not-implemented function pointers to NULL.
 *
 *********************************************************************************************************/
/************************************************************************************************************
 *
 *               DLL entry point (mandatory) - to query ACodec interface
 *
 ************************************************************************************************************/
/* prototype of entry point */
typedef int32 (*tUniACodecQueryInterface)(uint32 id, void ** func);

/*
Every core ACodec shall implement this function and tell a specific API function pointer.
If the queried API is not implemented, the ACodec shall set funtion pointer to NULL and return ACODEC_SUCCESS. */

EXTERN int32 UniACodecQueryInterface(uint32 id, void ** func);


/*******************************************************************
 * Codec Version Info
*******************************************************************/
typedef const char * (*UniACodecVersionInfo)();

/*******************************************************************
 * Codec  Create & Delete
*******************************************************************/
typedef UniACodec_Handle (*UniACodecCreate)(  UniACodecMemoryOps * memOps);

typedef int32 (*UniACodecDelete) (UniACodec_Handle pua_handle);

typedef int32 (*UniACodecReset) (UniACodec_Handle pua_handle);

/*******************************************************************
 * Codec  Initializaation
*******************************************************************/
/*typedef int32  (*UniACodecInit) (UniACodec_Handle pua_handle,
                                    uint8 * InputBuffer,
                                    uint32 inputLength,
                                    uint8 * codec_data);
*/
/*******************************************************************
 * Codec Query Memory
*******************************************************************/
//typedef int32  (*UniACodecQueryMem) (UniACodec_Config pADec_config);

/*******************************************************************
 * Codec set  & get parameter
*******************************************************************/
typedef int32 (*UniACodecSetParameter) (UniACodec_Handle pua_handle, UA_ParaType ParaType, UniACodecParameter * parameter);

typedef int32 (*UniACodecGetParameter) (UniACodec_Handle pua_handle, UA_ParaType ParaType, UniACodecParameter * parameter);

/*******************************************************************
 * Codec decode & encode frame
*******************************************************************/
typedef int32 (*UniACodec_decode_frame) (UniACodec_Handle pua_handle,
                                         uint8 * InputBuf,
                                         uint32 InputSize,
                                         uint32 * offset,
                                         uint8 ** OutputBuf,
                                         uint32 *OutputSize);

/*
typedef int32 (*UniACodec_encode_frame) (UniACodec_Handle pua_handle,
                                         uint8 * InputBuf,
                                         uint32 InputLength,
                                         uint32 * out_buf
                                         uint32 end_flag
                                         UA_ERROR_TYPE error_ret);
*/

typedef char * (*UniACodec_get_last_error) (UniACodec_Handle pua_handle);

/*******************************************************************
 *
API function ID
*******************************************************************/

enum /* API function ID */
{
    ACODEC_API_GET_VERSION_INFO  = 0x0,
    /* creation & deletion */
    ACODEC_API_CREATE_CODEC     = 0x1,
    ACODEC_API_DELETE_CODEC     = 0x2,
    /* reset */
    ACODEC_API_RESET_CODEC = 0x3,

    /* set parameter */
    ACODEC_API_SET_PARAMETER  = 0x10,
    ACODEC_API_GET_PARAMETER  = 0x11,

    /* process frame */
    ACODEC_API_DEC_FRAME    = 0x20,
    //ACODEC_API_ENC_FRAME    = 0x21,

    ACODEC_API_GET_LAST_ERROR = 0x1000,

};



#endif /* _Uni_ADEC_WRAPPER_H_ */

