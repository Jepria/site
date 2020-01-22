@echo off
rem Данный bat-файл загружает автодокументацию в директорию %HTTPD_HOME%\htdocs\docs.
rem
rem Документация проектов, расположенных в SVN, размещается в поддиректории javaenterpriseplatform/svn.
rem При этом выкачиваются лишь директории Module/%PROJECT_NAME%/Trunk/Doc. Если соответствующая
rem директория не существует, выполняется svn checkout, в противном случае - svn update.
rem
rem Репозитории git выкачивается целиком и размещается в поддиректории javaenterpriseplatform/git и oramake/git
rem , т.к. SourceForge не позволяет выкачивать заданную папку в виде архива (это функция API git v1.7,
rem а SF поддерживает только 1.6). Если директория не существует, выполняется git clone, в противном случае - git pull.
rem
rem На данный момент (20.07.2017) директория docs в развёрнутом виде весит 540 МБ.
if not defined HTTPD_HOME (
  echo Error: HTTPD_HOME not defined.
  exit 1
)
if not exist "%HTTPD_HOME%" (
  echo Error: httpd not found in %HTTPD_HOME% directory.
  exit 1
)

set HTDOCS_DIR=%HTTPD_HOME%/htdocs
set SVN_URI=http://svn.code.sf.net/p/javaenterpriseplatform/svn
set CATALINA_JEPRIA_DOC_DIR=%HTDOCS_DIR%/docs/javaenterpriseplatform/svn/Module/CatalinaJepria/Trunk/Doc/
set CMS_DOC_DIR=%HTDOCS_DIR%/docs/javaenterpriseplatform/svn/Module/Cms/Trunk/Doc/
set JEPRIASHOWCASE_DOC_DIR=%HTDOCS_DIR%/docs/javaenterpriseplatform/svn/Module/JepRiaShowcase/Trunk/Doc/
set NAVIGATION_DOC_DIR=%HTDOCS_DIR%/docs/javaenterpriseplatform/svn/Module/Navigation/Trunk/Doc/
set OPERATORSELFSERVICE_DOC_DIR=%HTDOCS_DIR%/docs/javaenterpriseplatform/svn/Module/OperatorSelfService/Trunk/Doc/
set SSOUI_DOC_DIR=%HTDOCS_DIR%/docs/javaenterpriseplatform/svn/Module/SsoUi/Trunk/Doc/
set SVNSEARCHER_DOC_DIR=%HTDOCS_DIR%/docs/javaenterpriseplatform/svn/Module/SvnSearcher/Trunk/Doc/

set JEP_GIT_URI=https://git.code.sf.net/p/javaenterpriseplatform/git
set JEP_GIT_DIR=%HTDOCS_DIR%/docs/javaenterpriseplatform/git

set ORAMAKE_GIT_URI=https://git.code.sf.net/p/oramake/git
set ORAMAKE_GIT_DIR=%HTDOCS_DIR%/docs/oramake/git

if exist "%CATALINA_JEPRIA_DOC_DIR%" (
  svn cleanup %CATALINA_JEPRIA_DOC_DIR%
  svn update %CATALINA_JEPRIA_DOC_DIR%
) else (
  svn checkout %SVN_URI%/Module/CatalinaJepria/Trunk/Doc/ %CATALINA_JEPRIA_DOC_DIR%
)

if exist "%CMS_DOC_DIR%" (
  svn cleanup %CMS_DOC_DIR%
  svn update %CMS_DOC_DIR%
) else (
  svn checkout %SVN_URI%/Module/Cms/Trunk/Doc/ %CMS_DOC_DIR%
)

if exist "%JEPRIASHOWCASE_DOC_DIR%" (
  svn cleanup %JEPRIASHOWCASE_DOC_DIR%
  svn update %JEPRIASHOWCASE_DOC_DIR%
) else (
  svn checkout %SVN_URI%/Module/JepRiaShowcase/Trunk/Doc/ %JEPRIASHOWCASE_DOC_DIR%
)

if exist "%NAVIGATION_DOC_DIR%" (
  svn cleanup %NAVIGATION_DOC_DIR%
  svn update %NAVIGATION_DOC_DIR%
) else (
  svn checkout %SVN_URI%/Module/Navigation/Trunk/Doc/ %NAVIGATION_DOC_DIR%
)

if exist "%OPERATORSELFSERVICE_DOC_DIR%" (
  svn cleanup %OPERATORSELFSERVICE_DOC_DIR%
  svn update %OPERATORSELFSERVICE_DOC_DIR%
) else (
  svn checkout %SVN_URI%/Module/OperatorSelfService/Trunk/Doc/ %OPERATORSELFSERVICE_DOC_DIR%
)

if exist "%SSOUI_DOC_DIR%" (
  svn cleanup %SSOUI_DOC_DIR%
  svn update %SSOUI_DOC_DIR%
) else (
  svn checkout %SVN_URI%/Module/SsoUi/Trunk/Doc/ %SSOUI_DOC_DIR%
)

if exist "%SVNSEARCHER_DOC_DIR%" (
  svn cleanup %SVNSEARCHER_DOC_DIR%
  svn update %SVNSEARCHER_DOC_DIR%
) else (
  svn checkout %SVN_URI%/Module/SvnSearcher/Trunk/Doc/ %SVNSEARCHER_DOC_DIR%
)

if exist "%JEP_GIT_DIR%" (
  git --work-tree=%JEP_GIT_DIR% --git-dir=%JEP_GIT_DIR%/.git pull
) else (
  git clone %JEP_GIT_URI% %JEP_GIT_DIR%
)

if exist "%ORAMAKE_GIT_DIR%" (
  git --work-tree=%ORAMAKE_GIT_DIR% --git-dir=%ORAMAKE_GIT_DIR%/.git pull
) else (
  git clone %ORAMAKE_GIT_URI% %ORAMAKE_GIT_DIR%
)

exit 0