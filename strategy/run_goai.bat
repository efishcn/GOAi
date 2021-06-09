@ECHO OFF
chcp 65001
TITLE 运行GOAi服务

SET JAR_PATH="D:\git\GOAi\strategy\application\web.jar"
SET GOAI_PORT=7758
ECHO %JAR_PATH%

SET LOCAL_JRE="%cd%\libs\jre1.8.0_171\bin\java"

REM 检测安装JAVA环境
if "%JAVA_HOME%"=="" (
    SET LOCAL_JRE="%cd%\libs\jre1.8.0_171\bin\java.exe"

    if not exist %LOCAL_JRE% (
        ECHO 请先安装JDK环境
        PAUSE
        EXIT
    )

    ECHO JAVA环境准备就绪，开始启动GOAi服务...
    START /B %LOCAL_JRE% -Xms64m -Xmx250m -jar %JAR_PATH% --server.port=%GOAI_PORT%
) else (
    ECHO 准备启动GOAi服务...
    START /B java -Xms64m -Xmx250m -jar %JAR_PATH% --server.port=%GOAI_PORT%
)

ECHO.
ECHO *******************************************************************
ECHO **                                                               **
ECHO **  请用谷歌浏览器本地访问 http://127.0.0.1:%GOAI_PORT%(默认7758端口)   **
ECHO **                                                               **
ECHO **         若Web服务启动较慢，打开浏览器后请刷新再试             **
ECHO **                                                               **
ECHO **         默认登录账号：goai       登录密码：goai123456         **
ECHO **                                                               **
ECHO *******************************************************************
ECHO.

CHOICE /t 5 /d y /n >nul
START iexplore "http://127.0.0.1:%GOAI_PORT%"
