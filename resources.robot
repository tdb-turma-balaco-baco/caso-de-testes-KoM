*** Settings ***
Documentation        Implementação das keywords dos casos de teste do Knights of Minecraft

Library    SeleniumLibrary
Library    DateTime
Library    String

*** Variables ***
#GERAIS
${BROWSER}            firefox
${URL}                https://kom.nevercraft.com.br/
${DESLOGAR_GERAL}           //input[contains(@type,'submit')]
#USUÁRIO
${TEXTO_PAG_INICIAL}       //h1[@class='fadeIn'][contains(.,'Bem-vindo, aventureiro')]
${TEXT_PAG_LOGIN}          //h2[@class='my-2'][contains(.,'Login')]
${TEXT_PAG_LOGIN_IP}       //h4[@class='mt-2 mb-0 mx-0 px-auto py-auto'][contains(.,'IP: kom.nevercraft.com.br')]
${TEXT_PAG_ACCOUNT}        //h2[@class='col-12 mx-0 px-0'][contains(.,'Sua conta:')]
${TEXT_PAG_ACCOUNT_X}      //span[@class='close col-12 text-right px-0'][contains(.,'×')]
${PAG_LOJA_TEXT}           //h2[contains(.,'Loja Mágica')]
${PAG_LOJA}                //a[contains(.,'Loja')]
${PAG_LOJA_VERIFICACAO}    //div[@class='text-center justify-self-center mx-auto my-3'][contains(.,'Sua conta ainda não está verificada. Verifique-a e depois compre Cash.')]
${PAG_LOJA_CODIGO}         b3e2abfc218e7badb5e7600c61b174aaa8d0ecb4
${EMAIL_USUARIO}           xoyoci7282@jobsfeel.com
${SENHA_USUARIO}           12345678
#ADMIN
${ADMIN_EMAIL}     izaelankpfer@gmail.com 
${ADMIN_SENHA}     1284DALVO
*** Keywords ***
Abrir Navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window
Fechar o Navegador
    Capture Page Screenshot
    Close Browser

Acessar o site
    Go To    ${URL}
    Wait Until Element Is Visible    ${TEXTO_PAG_INICIAL}
Clicar em login 
    Click Element    myBtn
Clicar em "perfil"
    Click Element    myBtn
Preencher campos de cadastro 
    Input Text    //input[contains(@autocomplete,'email')]  ${EMAIL_USUARIO}
    Input Text    (//input[contains(@id,'password')])[2]    ${SENHA_USUARIO}
    Input Text    //input[contains(@name,'password_confirmation')]    ${SENHA_USUARIO}
Se cadastrar clicando na aba de “registro”
    Clicar em login 
    Click Element   //a[@class='next'][contains(.,'❯')]
    Preencher campos de cadastro 
    Click Button    //button[@type='submit'][contains(.,'Registrar')]
    
Conferir se está cadastrado
    Wait Until Element Is Visible    ${TEXT_PAG_LOGIN_IP} 

Logar como "${ADMIN_EMAIL}" "${ADMIN_SENHA}"
    Input Text    (//input[contains(@id,'email')])[1]    ${ADMIN_EMAIL}
    Input Text    (//input[contains(@id,'password')])[1]   ${ADMIN_SENHA}
    Click Button    //button[@class='minebutton mb-2'][contains(.,'Entrar')]
    Wait Until Element Is Visible    ${TEXT_PAG_ACCOUNT}
    Click Element    ${TEXT_PAG_ACCOUNT_X}       
Logar com "${EMAIL_USUARIO}" "${SENHA_USUARIO}"
    Input Text    (//input[contains(@id,'email')])[1]    ${EMAIL_USUARIO}
    Input Text    (//input[contains(@id,'password')])[1]   ${SENHA_USUARIO}
    Click Button    //button[@class='minebutton mb-2'][contains(.,'Entrar')]
    Wait Until Element Is Visible    ${TEXT_PAG_LOGIN_IP}
    Click Element    ${TEXT_PAG_ACCOUNT_X}    
Acessar todos os menus disponíveis 
    Click Element    //a[contains(.,'Staff')]
    Wait Until Element Is Visible    //h2[@class='col-12 text-center'][contains(.,'Nosso time')]
    Click Element    //a[contains(.,'Guia')]
    Wait Until Element Is Visible    //b[contains(.,'Bem-vindo(a) à Wiki Knights of Minecraft!')]
    Acessar o site
    Click Element    ${PAG_LOJA}   
    Wait Until Element Is Visible    ${PAG_LOJA_TEXT}
    Click Element    //h2[contains(.,'Loja Mágica')]
    Acessar o site
Tentar “comprar cash”
    Click Element    ${PAG_LOJA}
    Wait Until Element Is Visible    ${PAG_LOJA_TEXT}
    Click Button    //button[@class='col-12 py-1 buybutton text-center px-0 mx-0'][contains(.,'Comprar Cash')]
Confirmar se o usuário não está verificado
    Wait Until Element Is Visible    //div[@class='text-center justify-self-center mx-auto my-3'][contains(.,'Sua conta ainda não está verificada. Verifique-a e depois compre Cash.')]
    
Resgatar "código"
    Click Element    ${PAG_LOJA}
    Wait Until Element Is Visible    ${PAG_LOJA_TEXT}
    Click Button    //button[contains(.,'Resgatar Código')]
    Wait Until Element Is Visible    //h2[contains(.,'Resgatar Código:')]
    Input Text    //input[contains(@class,'col-6 mx-5')]    ${PAG_LOJA_CODIGO} 
    Click Button    //button[@class='col-3 mx-5 px-0 text-center minebutton'][contains(.,'Resgatar')]
    Wait Until Element Is Visible    //div[@class='alert alert-success col-8 mx-5 mt-4'][contains(.,'Código resgatado com sucesso! Confira seu item novo no inventário do site')]

Acessar "dashboard de Administração"
    Clicar em "perfil"
    Click Element    //p[@class='py-1'][contains(.,'Dashboard de Admnistração')]
    Click Element    ${TEXT_PAG_ACCOUNT_X}    
Checar se usuário "Leguu aparece
    Input Text    //input[contains(@class,'mineinput')]    Leguu 
    Click Button    //button[@class='minebutton mx-0 px-3'][contains(.,'Buscar')] 
    Wait Until Element Is Visible    //td[@class='text-center'][contains(.,'Leguuu')]   
Deslogar 
    Click Element    ${DESLOGAR_GERAL}            
