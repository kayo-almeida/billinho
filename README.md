# API BILLINHO | DOCUMENTAÇÃO

## Rodando a aplicação em desenvolvimento

Primeiramente clone o projeto, em seguida acesse a pasta do projeto e então execute os seguintes comandos:

```
bundle install
rake db:create db:migrate db:seed
rails s
```	


## Lidando com os erros
Assim como em qualquer API Rest, é possível identificar o erro de acordo com o [código do estado HTTP](https://pt.wikipedia.org/wiki/Lista_de_c%C3%B3digos_de_estado_HTTP). De qualquer forma, quando o erro é previsto e tratado no backend da API, o formato do retorno é padronizado, o que facilita a exibição da informação ao usuário.

Sempre que uma requisição falhar, seja por algum erro na aplicação ou falta de informações nas requisições, o erro virá no padrão código a seguir:
```
{
    "status": "ERROR",
    "message": "unsuccessful request",
    "data": {
        "name": [
            "can't be blank"
        ],
        "cpf": [
            "has already been taken"
        ]
    }
}
```	 
Observe que dentro do índice **data**, temos um ***array*** que possibilita que vários erros sejam retornados de uma só vez.

## Filtros

Foi adicionado um sistema para filtrar os dados. Basta adicionar na URL o campo e o valor que está procurando e o sistema irá realizar a busca. Ex:

***GET /api/v1/students?name=Kayo&payment_method=Boleto***

Além disso é possivel selecionar apenas os campos que pretende visualizar utilizando o parametro **fields**. Ex:

***GET /api/v1/students?fields=id,name,birthday***

Você também pode ordenar os campos de acordo com sua necessidade. Para isso basta adicionar o campo **sort** seguido do campo que deseja ordenar. Caso queira ordenar de forma decrescente basta adicionar **-** antes do nome do campo. Ex: 

***GET /api/v1/students?sort=birthday***

ou

***GET /api/v1/students?sort=-birthday***

## Métodos
A seguir veja os métodos disponíveis na atual versão API, quais são seus requisitos, quais parâmetros devem ser fornecidos e qual o retorno esperado.

O URL base para as chamadas da API é sua URL de desenvolvimento. Geralmente é **http://localhost:3000**

### Alunos

---
#### GET /api/v1/students
Obtem uma lista com todos os alunos cadastrados

##### Retorno esperado:
```
{
    "status": "SUCCESS",
    "message": "successful requisition",
    "data": [
        {
            "id": 1,
            "name": "Stephen McGlynn",
            "cpf": "24688507005",
            "birthday": "1978-08-05",
            "phone": "50652474314",
            "gender": "F",
            "payment_method": "Boleto",
            "created_at": "2019-06-05T21:13:20.338Z",
            "updated_at": "2019-06-05T21:13:20.338Z"
        }
    ]
}
```

#### GET /api/v1/students/:id
Obtem os dados de um aluno específico

##### Retorno esperado:
```
{
    "status": "SUCCESS",
    "message": "successful requisition",
    "data": {
        "id": 2,
        "name": "Amira Koelpin",
        "cpf": "17425011563",
        "birthday": "1984-01-01",
        "phone": "45209516090",
        "gender": "F",
        "payment_method": "Cartão",
        "created_at": "2019-06-05T21:13:20.343Z",
        "updated_at": "2019-06-05T21:13:20.343Z"
    }
}
```

#### GET /api/v1/students/:student_id/registrations
Obtem os dados de matricula de um aluno específico

##### Retorno esperado:
```
{
    "status": "SUCCESS",
    "message": "successful requisition",
    "data": [
        {
            "id": 1,
            "total_course_amount": "2000.0",
            "installments_number": 7,
            "due_day": 6,
            "course_name": "Curso de teste",
            "educational_institution_id": 3,
            "student_id": 2,
            "created_at": "2019-06-06T17:04:18.973Z",
            "updated_at": "2019-06-06T17:04:18.973Z"
        }
    ]
}
```

#### GET /api/v1/students/:student_id/registrations/:registration_id
Obtem os dados de uma matricula específica de um aluno

##### Retorno esperado:
```
{
    "status": "SUCCESS",
    "message": "successful requisition",
    "data": {
        "id": 2,
        "total_course_amount": "2000.0",
        "installments_number": 7,
        "due_day": 6,
        "course_name": "Curso de teste",
        "educational_institution_id": 3,
        "student_id": 2,
        "created_at": "2019-06-06T17:07:05.242Z",
        "updated_at": "2019-06-06T17:07:05.242Z"
    }
}
```

#### POST /api/v1/students
Cria um novo aluno

##### Parâmetros:
PARÂMETRO | DESCRIÇÃO | Opcional
--------- | ------	  | ------
***String*** name | Nome do aluno | Não
***String*** cpf | CPF do aluno | Não
***Date*** birthday | Data de nascimento do aluno | Sim
***String*** phone | Telefone do aluno (Apenas números) | Sim
***String*** gender | Sexo do aluno (M ou F) | Não
***String*** payment_method | Método de pagamento do aluno (Boleto ou Cartão) | Não

##### Retorno esperado:
```
{
    "status": "SUCCESS",
    "message": "successful requisition",
    "data": {
        "id": 24,
        "name": "Kayo Almeida",
        "cpf": "93805596074",
        "birthday": "1991-01-07",
        "phone": "11941102401",
        "gender": "M",
        "payment_method": "Boleto",
        "created_at": "2019-06-07T16:16:23.778Z",
        "updated_at": "2019-06-07T16:16:23.778Z"
    }
}
```

#### PUT /api/v1/students/:id
Atualiza um aluno

##### Parâmetros:
PARÂMETRO | DESCRIÇÃO | Opcional
--------- | ------	  | ------
***String*** name | Nome do aluno | Não
***String*** cpf | CPF do aluno | Não
***Date*** birthday | Data de nascimento do aluno | Sim
***String*** phone | Telefone do aluno (Apenas números) | Sim
***String*** gender | Sexo do aluno (M ou F) | Não
***String*** payment_method | Método de pagamento do aluno (Boleto ou Cartão) | Não

##### Retorno esperado:
```
{
    "status": "SUCCESS",
    "message": "successful requisition",
    "data": {
        "id": 24,
        "name": "Kayo Almeida",
        "cpf": "93805596074",
        "birthday": "1991-01-07",
        "phone": "11941102401",
        "gender": "M",
        "payment_method": "Boleto",
        "created_at": "2019-06-07T16:16:23.778Z",
        "updated_at": "2019-06-07T16:16:23.778Z"
    }
}
```


#### DELETE /api/v1/students/:id
Deleta um aluno

##### Retorno esperado:
```
{
    "status": "SUCCESS",
    "message": "successful requisition",
    "data": {}
}
```

---


### Intituições de ensino

---
#### GET /api/v1/educational_institutions
Obtem uma lista com todas as instituições de ensino cadastradas

##### Retorno esperado:
```
{
    "status": "SUCCESS",
    "message": "successful requisition",
    "data": [
        {
            "id": 1,
            "name": "Christiansen, Herman and Flatley",
            "cnpj": "10827441367937",
            "institution_type": "Escola",
            "created_at": "2019-06-05T21:13:20.397Z",
            "updated_at": "2019-06-05T21:13:20.397Z"
        }
    ]
}
```

#### GET /api/v1/educational_institutions/:id
Obtem os dados de um instituição de ensino específica

##### Retorno esperado:
```
{
    "status": "SUCCESS",
    "message": "successful requisition",
    "data": {
        "id": 2,
        "name": "Breitenberg Inc",
        "cnpj": "28413811838255",
        "institution_type": "Universidade",
        "created_at": "2019-06-05T21:13:20.403Z",
        "updated_at": "2019-06-05T21:13:20.403Z"
    }
}
```

#### GET /api/v1/educational_institutions/:educational_institutions_id/registrations
Obtem os dados de matricula de uma instituição de ensino específica

##### Retorno esperado:
```
{
    "status": "SUCCESS",
    "message": "successful requisition",
    "data": [
        {
            "id": 1,
            "total_course_amount": "2000.0",
            "installments_number": 7,
            "due_day": 6,
            "course_name": "Curso de teste",
            "educational_institution_id": 3,
            "student_id": 2,
            "created_at": "2019-06-06T17:04:18.973Z",
            "updated_at": "2019-06-06T17:04:18.973Z"
        }
    ]
}
```

#### GET /api/v1/educational_institutions/:educational_institutions_id/registrations/:registrations_id
Obtem os dados de uma matricula específica de uma instituição de ensino

##### Retorno esperado:
```
{
    "status": "SUCCESS",
    "message": "successful requisition",
    "data": {
        "id": 2,
        "total_course_amount": "2000.0",
        "installments_number": 7,
        "due_day": 6,
        "course_name": "Curso de teste",
        "educational_institution_id": 3,
        "student_id": 2,
        "created_at": "2019-06-06T17:07:05.242Z",
        "updated_at": "2019-06-06T17:07:05.242Z"
    }
}
```

#### POST /api/v1/educational_institutions
Cria uma nova instituição de ensino

##### Parâmetros:
PARÂMETRO | DESCRIÇÃO | Opcional
--------- | ------	  | ------
***String*** name | Nome da instituição de ensino | Não
***String*** cnpj | CPF da instituição de ensino | Não
***String*** institution_type | Tipo de instituição (Universidade, Escola ou Creche) | Sim

##### Retorno esperado:
```
{
    "status": "SUCCESS",
    "message": "successful requisition",
    "data": {
        "id": 21,
        "name": "UNOPAR",
        "cnpj": "66253301000135",
        "institution_type": "Universidade",
        "created_at": "2019-06-07T16:29:55.259Z",
        "updated_at": "2019-06-07T16:29:55.259Z"
    }
}
```

#### PUT /api/v1/educational_institutions/:id
Atualiza uma instituição de ensino 

##### Parâmetros:
PARÂMETRO | DESCRIÇÃO | Opcional
--------- | ------	  | ------
***String*** name | Nome da instituição de ensino | Não
***String*** cnpj | CPF da instituição de ensino | Não
***String*** institution_type | Tipo de instituição (Universidade, Escola ou Creche) | Sim

##### Retorno esperado:
```
{
    "status": "SUCCESS",
    "message": "successful requisition",
    "data": {
        "id": 21,
        "name": "UNOPAR",
        "cnpj": "66253301000135",
        "institution_type": "Universidade",
        "created_at": "2019-06-07T16:29:55.259Z",
        "updated_at": "2019-06-07T16:29:55.259Z"
    }
}
```


#### DELETE /api/v1/educational_institutions/:id
Deleta uma instituição de ensino

##### Retorno esperado:
```
{
    "status": "SUCCESS",
    "message": "successful requisition",
    "data": {}
}
```

---

### Matrículas

---
#### GET /api/v1/registrations
Obtem uma lista com todas as matrículas cadastradas

##### Retorno esperado:
```
{
    "status": "SUCCESS",
    "message": "successful requisition",
    "data": [
        {
            "id": 1,
            "total_course_amount": "2000.0",
            "installments_number": 7,
            "due_day": 6,
            "course_name": "Curso de teste",
            "educational_institution_id": 3,
            "student_id": 2,
            "created_at": "2019-06-06T17:04:18.973Z",
            "updated_at": "2019-06-06T17:04:18.973Z"
        }
    ]
}
```

#### GET /api/v1/registrations/:id
Obtem os dados de um matrícula específica

##### Retorno esperado:
```
{
    "status": "SUCCESS",
    "message": "successful requisition",
    "data": {
        "id": 1,
        "total_course_amount": "2000.0",
        "installments_number": 7,
        "due_day": 6,
        "course_name": "Curso de teste",
        "educational_institution_id": 3,
        "student_id": 2,
        "created_at": "2019-06-06T17:04:18.973Z",
        "updated_at": "2019-06-06T17:04:18.973Z"
    }
}
```

#### GET /api/v1/registrations/:registrations_id/invoices
Obtem os dados de faturas de uma matrícula específica

##### Retorno esperado:
```
{
    "status": "SUCCESS",
    "message": "successful requisition",
    "data": [
        {
            "id": 1,
            "invoice_amount": "285.71",
            "due_date": "2019-08-10",
            "registration_id": 10,
            "status": 0,
            "created_at": "2019-06-06T17:26:16.202Z",
            "updated_at": "2019-06-06T17:26:16.202Z"
        }
    ]
}
```

#### GET /api/v1/registrations/:registrations_id/invoices/:invoices_id
Obtem os dados de uma fatura específica de uma matrícula

##### Retorno esperado:
```
{
    "status": "SUCCESS",
    "message": "successful requisition",
    "data": {
        "id": 1,
        "invoice_amount": "285.71",
        "due_date": "2019-08-10",
        "registration_id": 10,
        "status": 0,
        "created_at": "2019-06-06T17:26:16.202Z",
        "updated_at": "2019-06-06T17:26:16.202Z"
    }
}
```

#### POST /api/v1/registrations
Cria uma nova matrícula

##### Parâmetros:
PARÂMETRO | DESCRIÇÃO | Opcional
--------- | ------	  | ------
***String*** total_course_amount | Valor do curso | Não
***Integer*** installments_number | Número de faturas | Não
***Integer*** due_day | Data de vencimento das faturas | Não
***String*** course_name | Nome do curso | Não
***References*** educational_institution_id | ID da instituição de ensino | Não
***References*** student_id | ID do aluno | Não

##### Retorno esperado:
```
{
    "status": "SUCCESS",
    "message": "successful requisition",
    "data": {
        "id": 12,
        "total_course_amount": "1500.0",
        "installments_number": 3,
        "due_day": 5,
        "course_name": "Construindo uma API com Ruby on Rails",
        "educational_institution_id": 4,
        "student_id": 3,
        "created_at": "2019-06-07T16:42:50.718Z",
        "updated_at": "2019-06-07T16:42:50.718Z"
    }
}
```

#### PUT /api/v1/registrations/:id
Atualiza uma matrícula 

##### Parâmetros:
PARÂMETRO | DESCRIÇÃO | Opcional
--------- | ------	  | ------
***String*** total_course_amount | Valor do curso | Não
***Integer*** installments_number | Número de faturas | Não
***Integer*** due_day | Data de vencimento das faturas | Não
***String*** course_name | Nome do curso | Não
***References*** educational_institution_id | ID da instituição de ensino | Não
***References*** student_id | ID do aluno | Não

##### Retorno esperado:
```
{
    "status": "SUCCESS",
    "message": "successful requisition",
    "data": {
        "id": 12,
        "total_course_amount": "1500.0",
        "installments_number": 3,
        "due_day": 5,
        "course_name": "Construindo uma API com Ruby on Rails",
        "educational_institution_id": 4,
        "student_id": 3,
        "created_at": "2019-06-07T16:42:50.718Z",
        "updated_at": "2019-06-07T16:42:50.718Z"
    }
}
```


#### DELETE /api/v1/registrations/:id
Deleta uma matrícula

##### Retorno esperado:
```
{
    "status": "SUCCESS",
    "message": "successful requisition",
    "data": {}
}
```

---

### Faturas

---
#### GET /api/v1/invoices
Obtem uma lista com todas as faturas cadastradas

##### Retorno esperado:
```
{
    "status": "SUCCESS",
    "message": "successful requisition",
    "data": [
        {
            "id": 1,
            "invoice_amount": "285.71",
            "due_date": "2019-08-10",
            "registration_id": 10,
            "status": 0,
            "created_at": "2019-06-06T17:26:16.202Z",
            "updated_at": "2019-06-06T17:26:16.202Z"
        },
        {
            "id": 2,
            "invoice_amount": "285.71",
            "due_date": "2019-09-10",
            "registration_id": 10,
            "status": 0,
            "created_at": "2019-06-06T17:26:16.205Z",
            "updated_at": "2019-06-06T17:26:16.205Z"
        }
    ]
}
```

#### GET /api/v1/invoices/:id
Obtem os dados de um fatura específica

##### Retorno esperado:
```
{
    "status": "SUCCESS",
    "message": "successful requisition",
    "data": {
        "id": 3,
        "invoice_amount": "285.71",
        "due_date": "2019-10-10",
        "registration_id": 10,
        "status": 0,
        "created_at": "2019-06-06T17:26:16.207Z",
        "updated_at": "2019-06-06T17:26:16.207Z"
    }
}
```

---


that's all folks :)