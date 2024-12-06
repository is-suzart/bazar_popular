final errorMessages = {
  'required': (error) => "Esse campo é obrigatório",
  'email': (error) => "Digite um email válido",
  'minLength': (error) => 'A senha deve ter pelo menos ${error['requiredLength']} caracteres',
  'mustMatch': (error) => 'As senhas devem ser iguais'
};
