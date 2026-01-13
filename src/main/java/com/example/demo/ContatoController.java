package com.example.demo;

import java.util.Map;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*") // Isso permite que o React acesse o Java sem erros de segurança
public class ContatoController {

    @PostMapping("/contato")
    public Map<String, String> receberContato(@RequestBody Map<String, String> dados) {
        // Exibe no terminal do Java o que chegou do formulário
        System.out.println("Nome recebido: " + dados.get("nome"));
        System.out.println("Email recebido: " + dados.get("email"));
        System.out.println("Mensagem: " + dados.get("mensagem"));

        // Retorna uma resposta para o React
        return Map.of("status", "Sucesso", "mensagem", "O Java recebeu seus dados!");
    }
}