from cesar.cesar import encripta


def test_encripta_fabricio_retorna_snoevpvb():
    assert encripta('Fabricio') == 'snoevpvb'


def test_encripta_snoevpvb_retorna_fabricio():
    assert encripta('snoevpvb') == 'fabricio'


def test_encripta_deve_retornar_minusculas():
    assert encripta('A').islower()


def test_encripta_deve_preservar_os_espaços():
    resultado = encripta('e a')
    assert resultado[1] == ' '
