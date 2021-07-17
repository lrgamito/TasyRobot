*** Settings ***
Documentation     Teste para Login Valido do Tasy HTML5
...
Resource          resource.robot

*** Test Cases ***
Login Valido
    Abrir Tasy HTML5    tasyhtmldes:7030
    Pagina de Login Tem Estar Aberta
	Definir diretorio de screenshots
    Inserir Usuario    atualiza
    Inserir Senha    Daimoku4
    Enviar Credentiais
    Verificar Alerta
	Verificar Pagina Aplicacao Aberta
    Clicar Menu Usuario
    Clicar Sair
    [Teardown]  Fechar o Browser
    
