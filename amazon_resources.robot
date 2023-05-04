*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.amazon.com.br
${URL_ELETRONICOS}    https://www.amazon.com.br/s/ref=nb_sb_noss?__mk_pt_BR=%C3%85M%C3%85%C5%BD%C3%95%C3%91&url=search-alias%3Delectronics&field-keywords=&crid=11RYXY2J7UGSJ&sprefix=%2Celectronics%2C204
${MENU_TODOS}    //header/div[@id='navbar']/div[@id='nav-main']/div[1]/a[1]/span[1]
${TEXTO_HEADER_ELETRONICOS}    Eletrônicos e Tecnologia
${HEADER_ELETRONICOS}    //h1[contains(text(),'Eletrônicos e Tecnologia')]
${BOTAO_DE_PESQUISAR}    //input[contains(@value,'Ir')]
*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window
Fechar o navegador
    Close Browser
    Capture Page Screenshot
Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_TODOS}
Entrar no menu "Eletrônicos"
    Go To    url=${URL_ELETRONICOS}
    
Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Wait Until Page Contains    text=${TEXTO_HEADER_ELETRONICOS}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}
Verificar se o título da página fica "${TITLE}"
    Title Should Be    title=${TITLE}
Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=(//a[@aria-label='${NOME_CATEGORIA}'])[2]
Digitar o nome de produto "${TEXTO_PESQUISAR}" no campo de pesquisa
    Input Text    locator=//input[contains(@type,'text')]    text=${TEXTO_PESQUISAR}
Clicar no botão de pesquisa
    Click Button    locator=${BOTAO_DE_PESQUISAR}
Verificar o resultado da pesquisa se está listando o produto pesquisado
    Wait Until Element Is Visible    locator=//div[@class='a-section a-spacing-small a-spacing-top-small']