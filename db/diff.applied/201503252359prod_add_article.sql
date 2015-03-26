--
-- News Article
--
INSERT INTO `articles` (`id`, `lock_version`, `title`, `body`, `is_sticky`, `user_id`, `created_at`, `updated_at`)
  VALUES (NULL, '0', 'Aggiornamento dell''applicazione!', '<p>
    L''applicazione è stata portata alla versione <b>4.00.771</b>.
</p>
<u><b>Novità:</b></u>
<ul>
    <li>
        Aggiunti passaggi gara CSI III prova 2015 (Imola).
    </li>
    <li>
        Aggiunta start-list CSI IV prova 2015 (Carpi), più alcune correzioni su dati
        mancanti.
    </li>
</ul>
', '0', '1', NOW(), NOW());
