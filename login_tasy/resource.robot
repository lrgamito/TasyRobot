*** Settings ***
Documentation     Arquivo de recursos
...
...               Criado por Gamito
Library           SeleniumLibrary

*** Variables ***   
${BROWSER}        Chrome
${DELAY}          2

*** Keywords ***
Abrir Tasy HTML5
    [Arguments]     ${SERVER}
    Open Browser    http://${SERVER}/#/login    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Pagina de Login Tem Estar Aberta

Pagina de Login Tem Estar Aberta
    Title Should Be    Tasy
	Wait Until Element Is Enabled	loginUsername	4000

Inserir Usuario
    [Arguments]    ${username}
    Input Text    loginUsername    ${username}

Inserir Senha
    [Arguments]    ${password}
    Input Text    loginPassword    ${password}

Enviar Credentiais
    Click Button    Entrar

Verificar Pagina Aplicacao Aberta
    Title Should Be    Tasy
    Wait Until Page Contains Element    xpath://*[@id="info-btn"]/span    3000
	
Definir diretorio de screenshots
	Set Screenshot Directory	./screenshots

Verificar Alerta
    ${mensagens}=	Get Element Count   xpath://*[@id="ngdialog1"]/div[2]/div[1]/div[3]/div/button[2]
    Run Keyword If  ${mensagens} > 0    Click Button    Ok

Clicar Menu Usuario
    Click Element   xpath://*[@id="userData-dropdown-options"]/div/span

Clicar Sair
    Click Element   xpath://*[@id="userData-dropdown-options"]/ul/li[9]/div

Fechar o Browser
	Close Browser