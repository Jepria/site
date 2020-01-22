@echo off
rem ������ bat-���� ��������� ���������������� � ���������� %HTTPD_HOME%\htdocs\docs.
rem
rem ������������ ��������, ������������� � SVN, ����������� � ������������� javaenterpriseplatform/svn.
rem ��� ���� ������������ ���� ���������� Module/%PROJECT_NAME%/Trunk/Doc. ���� ���������������
rem ���������� �� ����������, ����������� svn checkout, � ��������� ������ - svn update.
rem
rem ����������� git ������������ ������� � ����������� � ������������� javaenterpriseplatform/git � oramake/git
rem , �.�. SourceForge �� ��������� ���������� �������� ����� � ���� ������ (��� ������� API git v1.7,
rem � SF ������������ ������ 1.6). ���� ���������� �� ����������, ����������� git clone, � ��������� ������ - git pull.
rem
rem �� ������ ������ (20.07.2017) ���������� docs � ���������� ���� ����� 540 ��.
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