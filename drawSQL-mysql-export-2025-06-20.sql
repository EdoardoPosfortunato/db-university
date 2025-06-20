CREATE TABLE `dipartimenti`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
);
CREATE TABLE `corso`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `corsi_laurea_id` BIGINT NOT NULL,
    `anno` DATE NOT NULL
);
CREATE TABLE `insegnanti`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nome` VARCHAR(255) NOT NULL,
    `data_nascita` DATETIME NOT NULL
);
CREATE TABLE `appelli`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `corso_id` BIGINT NOT NULL,
    `data` DATETIME NOT NULL,
    `studenti_id` BIGINT NOT NULL
);
CREATE TABLE `studenti`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nome` VARCHAR(255) NOT NULL,
    `data_nascita` DATETIME NOT NULL,
    `id_corsi` BIGINT NOT NULL
);
CREATE TABLE `Voto`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `voto` BIGINT NOT NULL
);
CREATE TABLE `corsi_insegnanti`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `inseganti_id` BIGINT NOT NULL,
    `corsi_id` BIGINT NOT NULL
);
ALTER TABLE
    `corsi_insegnanti` ADD INDEX `corsi_insegnanti_inseganti_id_corsi_id_index`(`inseganti_id`, `corsi_id`);
CREATE TABLE `corsi_laura`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `dipartimenti_id` BIGINT NOT NULL
);
CREATE TABLE `studenti_voto`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `studenti_id` BIGINT NOT NULL,
    `voto_id` BIGINT NOT NULL
);
ALTER TABLE
    `studenti_voto` ADD INDEX `studenti_voto_studenti_id_voto_id_index`(`studenti_id`, `voto_id`);
CREATE TABLE `appelli_studenti`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `studenti_id` BIGINT NOT NULL,
    `appelli_id` BIGINT NOT NULL
);
ALTER TABLE
    `corsi_insegnanti` ADD CONSTRAINT `corsi_insegnanti_inseganti_id_foreign` FOREIGN KEY(`inseganti_id`) REFERENCES `insegnanti`(`id`);
ALTER TABLE
    `studenti_voto` ADD CONSTRAINT `studenti_voto_studenti_id_foreign` FOREIGN KEY(`studenti_id`) REFERENCES `Voto`(`id`);
ALTER TABLE
    `corsi_insegnanti` ADD CONSTRAINT `corsi_insegnanti_corsi_id_foreign` FOREIGN KEY(`corsi_id`) REFERENCES `corso`(`id`);
ALTER TABLE
    `corso` ADD CONSTRAINT `corso_corsi_laurea_id_foreign` FOREIGN KEY(`corsi_laurea_id`) REFERENCES `corsi_laura`(`id`);
ALTER TABLE
    `studenti` ADD CONSTRAINT `studenti_id_corsi_foreign` FOREIGN KEY(`id_corsi`) REFERENCES `corso`(`id`);
ALTER TABLE
    `appelli_studenti` ADD CONSTRAINT `appelli_studenti_studenti_id_foreign` FOREIGN KEY(`studenti_id`) REFERENCES `studenti`(`id`);
ALTER TABLE
    `studenti_voto` ADD CONSTRAINT `studenti_voto_voto_id_foreign` FOREIGN KEY(`voto_id`) REFERENCES `studenti`(`id`);
ALTER TABLE
    `appelli` ADD CONSTRAINT `appelli_corso_id_foreign` FOREIGN KEY(`corso_id`) REFERENCES `corso`(`id`);
ALTER TABLE
    `corsi_laura` ADD CONSTRAINT `corsi_laura_dipartimenti_id_foreign` FOREIGN KEY(`dipartimenti_id`) REFERENCES `dipartimenti`(`id`);
ALTER TABLE
    `appelli_studenti` ADD CONSTRAINT `appelli_studenti_appelli_id_foreign` FOREIGN KEY(`appelli_id`) REFERENCES `appelli`(`id`);