CREATE TABLE `usuario` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nome` VARCHAR(255),
  `email` VARCHAR(255),
  `telefone` VARCHAR(20),
  `endereco` VARCHAR(255)
);

CREATE TABLE `servicos` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nome` VARCHAR(255),
  `descricao` TEXT
);

CREATE TABLE `pedidos` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `usuario_id` INT,
  `data_pedido` DATE
);

CREATE TABLE `socios` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `usuario_id` INT,
  `data_admissao` DATE
);

CREATE TABLE `historico_pedidos_socios` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `socio_id` INT,
  `pedido_id` INT
);

ALTER TABLE `servicos` ADD FOREIGN KEY (`id`) REFERENCES `usuario` (`id`);

ALTER TABLE `servicos` ADD FOREIGN KEY (`nome`) REFERENCES `usuario` (`nome`);

ALTER TABLE `pedidos` ADD FOREIGN KEY (`id`) REFERENCES `servicos` (`id`);

ALTER TABLE `socios` ADD FOREIGN KEY (`id`) REFERENCES `historico_pedidos_socios` (`id`);

ALTER TABLE `socios` ADD FOREIGN KEY (`usuario_id`) REFERENCES `historico_pedidos_socios` (`socio_id`);

ALTER TABLE `pedidos` ADD FOREIGN KEY (`id`) REFERENCES `historico_pedidos_socios` (`pedido_id`);
