### ------ Se fichier est fait pour SEPARER la Logique des tests ---------

*** Settings ***
Library    SeleniumLibrary
*** Variables ***
#---variables scalaire (variable qui contient SEULEMENT UNE seule valeur)
${url}=    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${browser}=    chrome
${admin}=    Admin
${password}=    admin123

*** Keywords ***
### ------- On va creer ci dessous des mots clés (keywords) personnalisés
se connecter au site demo orange 
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Sleep    4
remplir le formulaire de login 
    Clear Element Text    name:username
    Input Text    name:username    ${admin}
    Clear Element Text    name:password
    Input Password    name:password    ${password}
    Click Button    xpath://button[@type='submit']
    Sleep    3
valider l'affichage de la page d'acceuil
    page Should Contain    Dashboard 
    Sleep    2
se deconnecter de l'application orange 
    #Click Image    xpath:(//img[@alt='profile picture'])[1]
    Click Element    class:oxd-userdropdown-icon
    Sleep    4
    Click Link    link:Logout
    Sleep    2 
fermer le navigateur
    Sleep    2
    Close Browser

#### ---- Avec les keywors ci dessus on va pouvoir refaire le test tc02 directement en faisant appel au keywords :o))
