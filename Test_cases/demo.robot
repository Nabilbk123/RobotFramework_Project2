####-------------------------------------Ce fichier et considéré comme ma suite de test-----
###------il sera composé en 4 parties: (Settings, Variables,)


#La premiére section : ---------- settings (dependament de ce que je vais utiliser - Dans notre cas 'Selenium' pour le tests web
### On importera toutes nos librairies dont on a besoin sous ''settings''' ###
*** Settings ***
Library    SeleniumLibrary
Documentation    Ma premiere suite de test avec Robotframework
...    Ceci est un exemple de documentation  ### Documentation sert a mettre des notes 
...    pour expliquer mo(mes) tests


### ---- On doit IMPORTER la RESSOURCE -----
Resource    ../Ressources/ressourec1.robot


#---On peut creer autant de cas de tests que l'on veut
*** Test Cases ***
tc01 login_test  ### ---tc01 est une FONCTION (dans pythos) > On DOIT faire TABULATION en dessous
    [Documentation]    Ce test est établi pour tester la fonctionnalité login_test
    ...    tester le happy path  (les trois points mis pour mettre une autre ligne a la documentation)
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Sleep    4
    ###  -----------------Avant de saisir des valeurs dans les champs (username ou autre ) il FAUT s'assurer que le champ EST LIBRE
    ### ------------------Pour s'assurer que les champs sont libre

    Clear Element Text    name:username
    Input Text    name:username    ${admin}
    Clear Element Text    name:password
    Input Password    name:password    ${password}
    Click Button    xpath://button[@type='submit']
    ### ------------------ La ligne ci dessous est juste une ligne pour valider que nous sommes bien arrivés a la bonne page
    Sleep    3
    Page Should Contain    Dashboard       
    
    Close Browser
    

        
tc02 logout_test
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Sleep    4
    Clear Element Text    name:username
    Input Text    name:username    ${admin}
    Clear Element Text    name:password
    Input Password    name:password    ${password}
    Click Button    xpath://button[@type='submit']
    Sleep    3
    #Click Image    xpath:(//img[@alt='profile picture'])[1]  ### --- C'est ce que le prof a fait dans le cours / mais cela fonctionne aussi par: class
    Click Element    class:oxd-userdropdown-icon
    Sleep    4
    Click Link    link:Logout
    Sleep    2 
    Close Browser
tc03 logout_test_utilisant_keywords
    se connecter au site demo orange
    remplir le formulaire de login
    valider l'affichage de la page d'acceuil
    se deconnecter de l'application orange
    fermer le navigateur

