{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

Author:       François PIETTE
              http://www.overbyte.be
              http://francois-piette.blogspot.be
Creation:     Jul 16, 2013
Description:  Create AVI file from bitmap. Based on the article by Gopalakrishna
              Palemat at:
              http://www.codeproject.com/Articles/5055/Create-a-movie-from-an-HBitmap
              http://gopalakrishna.palem.in/
Porting notes Fixed code to use bitsperpixel in memory buffer calculation.
              Removed limitation video no bigger than screen size.
              Added argument to constructor so that dwRate and dwScale can be
              passed to allow better control of very low frame rate.
Version:      1.00
History:


 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
unit AviFromBitmaps;

interface

uses
    Windows, Messages, Types, Classes, SysUtils, VfW;

type
    TAppendFrameFct     = function (ABitmap       : HBITMAP)
                                   : HRESULT of object;
    TAppendFrameBitsFct = function (nWidth        : Integer;
                                    nHeight       : Integer;
                                    pBits         : Pointer;
                                    nBitsPerPixel : Integer)
                                   : HRESULT of object;

    TAviFromBitmaps = class(TComponent)
    private
        m_hAviDC               : HDC;
        m_hHeap                : THANDLE;
        m_lpBits               : Pointer;            // Useful for holding the bitmap content, if any
        m_lSample              : LONGLONG;//LONG;               // Keeps track of the current Frame Index
        m_pAviFile             : PAVIFILE;
        m_pAviStream           : PAVISTREAM;
        m_pAviCompressedStream : PAVISTREAM;
        m_AviStreamInfo        : TAVISTREAMINFO;
        m_AviCompressOptions   : TAVICOMPRESSOPTIONS;
        m_dwRate               : DWORD;             // FPS = dwRate / dwScale
        m_dwScale              : DWORD;             //
        m_dwFCCHandler         : DWORD;             // Video Codec FourCC
        m_szFileName           : String;            // Holds the Output Movie File Name
        m_szErrMsg             : String;            // Holds the Last Error Message, if any

        m_nAppendFuncSelector  : Integer;           // 0=Dummy 1=FirstTime 2=Usual

        pAppendFrame           : array [0..2] of TAppendFrameFct;
        pAppendFrameBits       : array [0..2] of TAppendFrameBitsFct;

        function AppendFrameFirstTime(ABitMap : HBITMAP) : HRESULT; overload;
        function AppendFrameUsual(ABitMap : HBITMAP) : HRESULT; overload;
        function AppendDummy(ABitMap : HBITMAP) : HRESULT; overload;

        function AppendFrameFirstTime(nWidth        : Integer;
                                      nHeight       : Integer;
                                      pBits         : Pointer;
                                      nBitsPerPixel : Integer) : HRESULT; overload;
        function AppendFrameUsual(nWidth        : Integer;
                                  nHeight       : Integer;
                                  pBits         : Pointer;
                                  nBitsPerPixel : Integer) : HRESULT; overload;
        function AppendDummy(nWidth        : Integer;
                             nHeight       : Integer;
                             pBits         : Pointer;
                             nBitsPerPixel : Integer) : HRESULT; overload;

        // Takes care of creating the memory, streams, compression
        // options etc. required for the movie
        function InitMovieCreation(nFrameWidth   : Integer;
                                   nFrameHeight  : Integer;
                                   nBitsPerPixel : Integer) : HRESULT;

        // Takes care of releasing the memory and movie related handles
        procedure ReleaseMemory;

       // Sets the Error Message
       procedure SetErrorMessage(const lpszErrMsg : String);
    public
        constructor Create(AOwner : TComponent); override;
        // Constructor accepts the filename, video code and frame rate settings
        // as parameters.
        // lpszFileName: Name of the output movie file to create
        // dwCodec: FourCC of the Video Codec to be used for compression
        // dwFrameRate: The Frames Per Second (FPS) setting to be used for the movie
        // The default Codec used here is MPG4. To use a different codec, pass its Fourcc
        // value as the input parameter for dwCodec.
        // For example,
        // pass mmioFOURCC('D','I','V','X') to use DIVX codec, or
        // pass mmioFOURCC('I','V','5','0') to use IV50 codec etc...
        //
        // Also, you can pass just 0 to avoid the codecs altogether. In that case, Frames
        // would be saved as they are without any compression; However, the output movie file
        // size would be very huge in that case.
        //
        // Finally, make sure you have the codec installed on the machine before
        // passing its Fourcc here.
        constructor CreateAviFile(AOwner             : TComponent;
                                  const lpszFileName : String = 'Output.avi';
                                  dwCodec            : DWORD  = $3447504D; // mmioFOURCC('M','P','G','4');
                                  dwFrameRate        : DWORD  = 1;
                                  dwFrameScale       : DWORD  = 1);

        // Destructor closes the movie file and flushes all the frames
        destructor Destroy; override;

        /// Inserts the given HBitmap into the movie as a new Frame at the end.
        function AppendNewFrame(ABitmap : HBITMAP) : HRESULT; overload;

        // Inserts the given bitmap bits into the movie as a
        // new Frame at the end. The width, height and nBitsPerPixel
        // are the width, height and bits per pixel of the bitmap
        // pointed to by the input pBits.
        function AppendNewFrame(nWidth        : Integer;
                                nHeight       : Integer;
                                pBits         : Pointer;
                                nBitsPerPixel : Integer) : HRESULT; overload;

        // Returns the last error message, if any.
        function GetLastErrorMessage : String;  // return m_szErrMsg;
    end;

implementation

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}

{ TAviFile }

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TAviFromBitmaps.AppendDummy(
    ABitMap: HBITMAP): HRESULT;
begin
    Result := E_FAIL;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TAviFromBitmaps.AppendDummy(
    nWidth        : Integer;
    nHeight       : Integer;
    pBits         : Pointer;
    nBitsPerPixel : Integer): HRESULT;
begin
    Result := E_FAIL;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TAviFromBitmaps.AppendFrameFirstTime(
    ABitMap: HBITMAP): HRESULT;
var
    Bitmap : Windows.TBITMAP;
begin
    GetObject(ABitmap, sizeof(BITMAP), @Bitmap);
    if InitMovieCreation(Bitmap.bmWidth,
                         Bitmap.bmHeight,
                         Bitmap.bmBitsPixel) >= 0 then begin
            m_nAppendFuncSelector := 2; // Point to the UsualAppend Function
            Result := AppendFrameUsual(ABitmap);
            Exit;
    end;
    ReleaseMemory;
    Result := E_FAIL;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TAviFromBitmaps.AppendFrameFirstTime(
    nWidth        : Integer;
    nHeight       : Integer;
    pBits         : Pointer;
    nBitsPerPixel : Integer): HRESULT;
begin
    if InitMovieCreation(nWidth, nHeight, nBitsPerPixel) >= 0 then begin
        m_nAppendFuncSelector := 2; // Point to the UsualAppend Function
        Result := AppendFrameUsual(nWidth, nHeight, pBits, nBitsPerPixel);
        Exit;
    end;
    ReleaseMemory;
    Result := E_FAIL;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TAviFromBitmaps.AppendFrameUsual(
    nWidth        : Integer;
    nHeight       : Integer;
    pBits         : Pointer;
    nBitsPerPixel : Integer): HRESULT;
var
    dwSize : DWORD;
begin
    dwSize := nWidth * nHeight * nBitsPerPixel div 8;
    if AVIStreamWrite(m_pAviCompressedStream, m_lSample, 1, pBits,
                      dwSize, 0, nil, nil) < 0 then begin
        SetErrorMessage('Unable to Write Video Stream to the output Movie File');
        ReleaseMemory;
        Result := E_FAIL;
        Exit;
    end;
    Inc(m_lSample);
    Result := S_OK;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TAviFromBitmaps.AppendFrameUsual(
    ABitMap : HBITMAP): HRESULT;
var
    bmpInfo : BITMAPINFO;
begin
    Result                       := E_FAIL;
    bmpInfo.bmiHeader.biBitCount := 0;
    bmpInfo.bmiHeader.biSize     := sizeof(BITMAPINFOHEADER);

    GetDIBits(m_hAviDC, ABitmap, 0, 0, nil, bmpInfo, DIB_RGB_COLORS);

    bmpInfo.bmiHeader.biCompression := BI_RGB;

    GetDIBits(m_hAviDC, ABitmap, 0, bmpInfo.bmiHeader.biHeight,
              m_lpBits, bmpInfo, DIB_RGB_COLORS);

    if AVIStreamWrite(m_pAviCompressedStream, m_lSample, 1, m_lpBits,
                      bmpInfo.bmiHeader.biSizeImage, 0, nil, nil) < 0 then begin
        SetErrorMessage('Unable to Write Video Stream to the output Movie File');
        ReleaseMemory;
        Exit;
    end;
    Inc(m_lSample);
    Result := S_OK;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TAviFromBitmaps.AppendNewFrame(
    ABitmap : HBITMAP): HRESULT;
begin
    Result := pAppendFrame[m_nAppendFuncSelector](ABitmap);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TAviFromBitmaps.AppendNewFrame(
    nWidth        : Integer;
    nHeight       : Integer;
    pBits         : Pointer;
    nBitsPerPixel : Integer): HRESULT;
begin
    Result := pAppendFrameBits[m_nAppendFuncSelector](nWidth, nHeight, pBits,
                                                      nBitsPerPixel);
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
constructor TAviFromBitmaps.Create(AOwner: TComponent);
begin
    inherited Create(AOwner);
    AVIFileInit;
    m_szErrMsg             := 'Method Succeeded';
    m_dwRate               := 1;
    m_dwScale              := 1;
    pAppendFrame[0]        := AppendDummy;
    pAppendFrame[1]        := AppendFrameFirstTime;
    pAppendFrame[2]        := AppendFrameUsual;
    pAppendFrameBits[0]    := AppendDummy;
    pAppendFrameBits[1]    := AppendFrameFirstTime;
    pAppendFrameBits[2]    := AppendFrameUsual;
    m_nAppendFuncSelector  := 1;     //0=Dummy 1=FirstTime 2=Usual
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
constructor TAviFromBitmaps.CreateAviFile(
    AOwner             : TComponent;
    const lpszFileName : String;
    dwCodec            : DWORD;
    dwFrameRate        : DWORD;
    dwFrameScale       : DWORD);
begin
    Create(AOwner);
    m_dwFCCHandler         := dwCodec;
    m_dwRate               := dwFrameRate;
    m_dwScale              := dwFrameScale;
    m_szFileName           := lpszFileName;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
destructor TAviFromBitmaps.Destroy;
begin
    ReleaseMemory;
    inherited Destroy;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TAviFromBitmaps.GetLastErrorMessage : String;
begin
    Result := m_szErrMsg;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
function TAviFromBitmaps.InitMovieCreation(
    nFrameWidth   : Integer;
    nFrameHeight  : Integer;
    nBitsPerPixel : Integer): HRESULT;
var
    nMaxWidth  : Integer;
    nMaxHeight : Integer;
    bmpInfo    : TBITMAPINFO;
begin
//    nMaxWidth  := GetSystemMetrics(SM_CXSCREEN);
//    nMaxHeight := GetSystemMetrics(SM_CYSCREEN);
    Result     := E_FAIL;

    m_hAviDC := CreateCompatibleDC(0);
    if m_hAviDC = 0 then begin
        SetErrorMessage('Unable to Create Compatible DC');
        Exit;
    end;

//  if nFrameWidth  > nMaxWidth then
        nMaxWidth  := nFrameWidth;
//  if nFrameHeight > nMaxHeight then
        nMaxHeight := nFrameHeight;

    m_hHeap := HeapCreate(HEAP_NO_SERIALIZE,
                          nMaxWidth * nMaxHeight * (nBitsPerPixel div 8), 0);
    if m_hHeap = 0 then begin
        SetErrorMessage('Unable to Create Heap');
        Exit;
    end;

    m_lpBits := HeapAlloc(m_hHeap,
                          HEAP_ZERO_MEMORY or HEAP_NO_SERIALIZE,
                          nMaxWidth * nMaxHeight * nBitsPerPixel div 8);
    if not Assigned(m_lpBits) then begin
        SetErrorMessage('Unable to Allocate Memory on Heap');
        Exit;
    end;

    if AVIFileOpenW(m_pAviFile, PChar(m_szFileName),
                    OF_CREATE or OF_WRITE, nil) < 0 then begin
        SetErrorMessage('Unable to Create the Movie File');
        Exit;
    end;

    ZeroMemory(@m_AviStreamInfo, sizeof(TAVISTREAMINFO));
    m_AviStreamInfo.fccType    := streamtypeVIDEO;
    m_AviStreamInfo.fccHandler := m_dwFCCHandler;
    m_AviStreamInfo.dwScale    := m_dwScale;
    m_AviStreamInfo.dwRate     := m_dwRate;
    m_AviStreamInfo.dwQuality  := DWORD(-1);            // Default Quality
    m_AviStreamInfo.dwSuggestedBufferSize := nMaxWidth * nMaxHeight *
                                             (nBitsPerPixel div 8);
    SetRect(m_AviStreamInfo.rcFrame, 0, 0, nFrameWidth, nFrameHeight);
    m_AviStreamInfo.szName    := 'Video Stream';

    if AVIFileCreateStream(m_pAviFile, m_pAviStream, @m_AviStreamInfo) < 0  then begin
        SetErrorMessage('Unable to Create Video Stream in the Movie File');
        Exit;
    end;

    ZeroMemory(@m_AviCompressOptions, sizeof(TAVICOMPRESSOPTIONS));
    m_AviCompressOptions.fccType    := streamtypeVIDEO;
    m_AviCompressOptions.fccHandler := m_AviStreamInfo.fccHandler;
    m_AviCompressOptions.dwFlags    := AVICOMPRESSF_KEYFRAMES or
                                       AVICOMPRESSF_VALID;
                                       // or AVICOMPRESSF_DATARATE;
    m_AviCompressOptions.dwKeyFrameEvery := 1;
    //m_AviCompressOptions.dwBytesPerSecond := 1000 div 8;
    //m_AviCompressOptions.dwQuality        := 100;

    if AVIMakeCompressedStream(m_pAviCompressedStream, m_pAviStream,
                               @m_AviCompressOptions, nil) < 0  then begin
        // One reason this error might occur is if you are using a Codec that
        // is not available on your system. Check the mmioFOURCC() code you
        // are using and make sure you have that codec installed properly
        // on your machine.
        SetErrorMessage('Unable to Create Compressed Stream: Check your CODEC options');
        Exit;
    end;

    ZeroMemory(@bmpInfo, sizeof(TBITMAPINFO));
    bmpInfo.bmiHeader.biPlanes      := 1;
    bmpInfo.bmiHeader.biWidth       := nFrameWidth;
    bmpInfo.bmiHeader.biHeight      := nFrameHeight;
    bmpInfo.bmiHeader.biCompression := BI_RGB;
    bmpInfo.bmiHeader.biBitCount    := nBitsPerPixel;
    bmpInfo.bmiHeader.biSize        := sizeof(BITMAPINFOHEADER);
    bmpInfo.bmiHeader.biSizeImage   := bmpInfo.bmiHeader.biWidth *
                                       bmpInfo.bmiHeader.biHeight *
                                       (bmpInfo.bmiHeader.biBitCount div 8);

    if AVIStreamSetFormat(m_pAviCompressedStream, 0, @bmpInfo,
                          bmpInfo.bmiHeader.biSize) < 0 then begin
        // One reason this error might occur is if your bitmap does not
        // meet the Codec requirements.
        // For example, your bitmap is 32bpp while the Codec supports only
        // 16 or 24 bpp; Or your bitmap is 274 * 258 size, while the Codec
        // supports only sizes that are powers of 2; etc...
        // Possible solution to avoid this is: make your bitmap suit the
        // codec requirements, or Choose a codec that is suitable for
        // your bitmap.
        SetErrorMessage('Unable to Set Video Stream Format');
        Exit;
    end;

    Result := S_OK;   // Everything went Fine
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TAviFromBitmaps.ReleaseMemory;
begin
    m_nAppendFuncSelector := 0;   // Point to DummyFunction

    if m_hAviDC <> 0 then begin
        DeleteDC(m_hAviDC);
        m_hAviDC := 0;
    end;
    if Assigned(m_pAviCompressedStream) then begin
        AVIStreamRelease(m_pAviCompressedStream);
        m_pAviCompressedStream := nil;
    end;
    if Assigned(m_pAviStream) then begin
        AVIStreamRelease(m_pAviStream);
        m_pAviStream := nil;
    end;
    if Assigned(m_pAviFile) then begin
        AVIFileRelease(m_pAviFile);
        m_pAviFile := nil;
    end;
    if Assigned(m_lpBits) then begin
        HeapFree(m_hHeap,HEAP_NO_SERIALIZE,m_lpBits);
        m_lpBits := nil;
    end;
    if m_hHeap <> 0 then begin
        HeapDestroy(m_hHeap);
        m_hHeap := 0;
    end;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
procedure TAviFromBitmaps.SetErrorMessage(
    const lpszErrMsg : String);
begin
    m_szErrMsg := lpszErrMsg;
end;


{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}

end.
