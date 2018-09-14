# Plan pracy

### Plan

1. Czyszczenie warning-ów (użycie FixInsight)
2. Wprowadzenie do konwencji nazw
    - Przełączenie na gałęź ze zmienionymi nazwami unit-ów
    - ```git checkout``` oraz ```git merge```
3. Wprowadzenie do Git-a
4. Wprowadzenie do Clean Code
5. Wybór kilku zadań
6. Dopisanie brakujących issues i przydzielenie zadań
7. Pull Request
    * Przeglądy kody źródłowego
8. Unit tests - DUnitX


### Do wyjaśnienia
- Code Reviews - zaznaczanie kodu do przeglądu i komentowanie
- Skrypt zmieniający nazwy plików {{stary}} {{nowy} 
    ```
    git mv {{stary}}.pas {{nowy}}.pas
    git mv {{stary}}.dfm {{nowy}}.dfm
    more +1 {{nowy}}.pas > {{nowy}}.tmp1  # Usunięcie 1 linii
    echo "Unit {{nowy}};" > {{nowy}}.tmp2
    type {{nowy}}.tmp1 >> {{nowy}}.tmp2
    type {{nowy}}.tmp2 > {{nowy}}.pas
    del {{nowy}}.tmp1
    del {{nowy}}.tmp1
    ```

### Warsztat metodyczny

* Artykuł: [Dobre praktyki programowania](./GoodPractices.md)
