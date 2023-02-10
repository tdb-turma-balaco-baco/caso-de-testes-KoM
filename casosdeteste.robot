*** Settings ***
Documentation    Esta suíte de testes verifica o funcionamento das funções de usuários e administrador no site Knights of Minecraft.
Resource          resources.robot
Test Setup        Abrir Navegador
Test Teardown     Fechar o Navegador   


*** Test Cases ***
Caso de Teste 1: Cadastrar um novo Usuário
    [Tags]    cadastrar    usuario
    Acessar o site
    Se cadastrar clicando na aba de “registro”
    Conferir se está cadastrado
    Deslogar
Caso de Teste 2: Verificar se o usuário tem acesso aos conteúdos do site
    [Tags]    conteudos    usuario 
    Acessar o site
    Clicar em login
    Logar com "${EMAIL_USUARIO}" "${SENHA_USUARIO}"
    Acessar todos os menus disponíveis 
    Clicar em "perfil"
    Deslogar 
Caso de Teste 3: Verificar se o usuário não verificado pode comprar “cash”         
    [Tags]    verificado    usuario 
    Acessar o site
    Clicar em login
    Logar com "${EMAIL_USUARIO}" "${SENHA_USUARIO}"
    Tentar “comprar cash”
    Confirmar se o usuário não está verificado
    Clicar em "perfil"
    Deslogar
Caso de Teste 4: Verificar se o usuário pode resgatar códigos
    [Tags]    codigo    usuario
    Acessar o site
    Clicar em login
    Logar com "${EMAIL_USUARIO}" "${SENHA_USUARIO}"
    Resgatar "código"
    Clicar em "perfil"
    Deslogar 
Caso de Teste 5: Acessar “Dashboard de Administração” como administrador
    [Tags]    dashboard    administrador 
    Acessar o site
    Clicar em login
    Logar como "${ADMIN_EMAIL}" "${ADMIN_SENHA}"
    Acessar "dashboard de Administração"
    Checar se usuário "Leguu aparece
    Clicar em "perfil"
    Deslogar 