import emoji

nome = input('\33[31:40mQual é o teu nome?\33[m ')
print('-='*15)
print(f'Olá {nome}. Bem vindo ao meu Quiz!!!')

jogar = input('\33[31:40mQueres jogar [SIM/NÃO]?\33[m ').lower()
if jogar != 'sim':
    print(f'Obrigado pela tua participação {nome}. Até um dia!!!')
    quit()

print(emoji.emojize('Ok, Vamos jogar!!! 😀'))
score = 0

print('-='*15)
pergunta = input('\33[31:40mQuem é o 1º rei de Portugal?\33[m ')
print('-='*15)
if pergunta == "Afonso Henriques":
    print('\33[4:32:40mCorrecto, Muito bem!!\33[m')
    score += 1
else:
    print('Incorrecto...')


print('-='*15)
pergunta = float(input('\33[31:40mQual é o valor de Pi, arredondado ás décimas?\33[m '))
print('-='*15)
if pergunta == 3.14:
    print('Correcto, Muito bem!!')
    score += 1
else:
    print('Incorrecto!!!')


print('-='*15)
pergunta = input('\33[31:40mQual é a capital dos USA?\33[m ')
print('-='*15)
if pergunta == 'Washington':
    print('Correcto, Muito bem!!')
    score += 1
else:
    print('Incorrecto!!!')



print('-='*15)
pergunta = input('\33[31:40mEm que cidade fica Torre Eiffel?\33[m  ')
print('-='*15)
if pergunta == 'Paris':
    print('Correcto, Muito bem!!')
    score += 1
else:
    print('Incorrecto!!!')


print('-='*15)
pergunta = input('\33[31:40mEm que país é Leonardo Da Vinci?\33[m ')
print('-='*15)
if pergunta == 'Italia':
    print('Correcto, Muito bem!!')
    score += 1
else:
    print('Incorrecto!!!')


print('-='*15)
pergunta = int(input('\33[31:40mEm que ano o homem pisou a lua?\33[m '))
print('-='*15)
if pergunta == 1969:
    print('Correcto, Muito bem!!')
    score += 1
else:
    print('Incorrecto!!!')


print('-='*15)
pergunta = input('\33[31:40mQual a capital do Brasil?\33[m ')
print('-='*15)
if pergunta == 'Brasília':
    print('Correcto, Muito bem!!')
    score += 1
else:
    print('Incorrecto!!!')

print(f'\33[32:40mConseguis-te {score} pontos!!!\33[m 😀')
print(f'\33[32Conseguis-te ' + str((score / 7) * 100)+ '%.\33[m')