function createColorPalette(filename)
    % Skapar en färgpalett och sparar den i en .mat-fil

    % Lista med RGB-värden för färgerna
colors = [
    % Röd
    1 0 0;
    % Grön
    0 1 0;
    % Blå
    0 0 1;
    % Gul
    1 1 0;
    % Orange
    1 0.5 0;
    % Lila
    0.5 0 0.5;
    % Rosa
    1 0.4 0.7;
    % Turkos
    0 1 1;
    % Svart
    0 0 0;
    % Vit
    1 1 1;
    % Cyan
    0 1 1;
    % Magenta
    1 0 1;
    % Limegrön
    0.5 1 0;
    % Indigo
    0.29 0 0.51;
    % Guld
    1 0.84 0;
    % Silver
    0.75 0.75 0.75;
    % Brun
    0.64 0.16 0.16;
    % Beige
    0.96 0.96 0.86;
    % Mörkgrön
    0 0.39 0;
    % Mörkblå
    0 0 0.55;
    % Mörkröd
    0.55 0 0;
    % Mörkorange
    1 0.55 0;
    % Mörklila
    0.5 0 0.5;
    % Mörkrosa
    0.91 0.45 0.5;
    % Mörkturkos
    0 0.55 0.55;
    % Grå
    0.5 0.5 0.5;
    % Ljusgrå
    0.75 0.75 0.75;
    % Mörkcyangrön
    0 0.55 0.39;
    % Olivgrön
    0.5 0.5 0;
    % Tangerine
    0.95 0.45 0.07;
    % Persika
    1 0.8 0.64;
    % Lavendel
    0.71 0.49 0.86;
    % Saffran
    0.96 0.77 0.19;
    % Mintgrön
    0.24 0.71 0.54;
    % Mörkmagenta
    0.55 0 0.55;
    % Persikorosa
    1 0.71 0.75;
    % Babyblå
    0.54 0.81 0.94;
    % Salvia
    0.56 0.69 0.2;
    % Dimgrå
    0.41 0.41 0.41;
    % Turkosblå
    0 0.5 0.5;
    % Skogsgrön
    0.13 0.55 0.13;
    % Korall
    1 0.5 0.31;
    % Plommon
    0.56 0.27 0.52;
    % Rubinröd
    0.88 0.07 0.37;
    % Smaragdgrön
    0.31 0.78 0.47;
    % Rosenkvarts
    0.98 0.68 0.82;
    % Azur
    0 0.5 1;
    % Burgundy
    0.5 0 0.13;
    % Elfenben
    1 1 0.94;
    % Periwinkle
    0.8 0.8 1;
    % Sand
    0.76 0.7 0.5;
    % Linne
    0.98 0.94 0.9;
    % Granit
    0.4 0.4 0.4;
    % Mokka
    0.5 0.25 0;
    % Marinen
    0 0 0.5;
    % Grädde
    1 0.99 0.9;
    % Persika
    1 0.8 0.64;
    % Marmor
    0.98 0.98 0.98;
    % Rökt kaviar
    0.06 0.05 0.03;
    % Bebisblå
    0.79 0.75 0.91;
    % Jaspis
    0.82 0.41 0.12;
    % Pärla
    1 0.96 0.93;
    % Krita
    0.94 0.91 0.88;
    % Kornblomma
    0.39 0.58 0.93;
    % Cyangrön
    0.0 0.6 0.6;
    % Metall
    0.6 0.6 0.6;
    % Mandel
    0.94 0.87 0.8;
    % Fläder
    0.67 0.13 0.56;
    % Oliv
    0.5 0.5 0;
    % Vinröd
    0.5 0 0.13;
    % Ädelsten
    0.0 0.4 0.4;
    % Rök
    0.5 0.5 0.5;
    % Bly
    0.56 0.64 0.69;
    % Lera
    0.88 0.81 0.62;
    % Aubergine
    0.44 0.0 0.5;
    % Körsbär
    0.87 0.19 0.39;
    % Korallrosa
    0.97 0.51 0.47;
    % Majolica
    0.94 0.85 0.55;
    % Kakao
    0.49 0.24 0.09;
    % Koppar
    0.72 0.45 0.20;
    % Krita
     0.94 0.91 0.88;
    % Koboltblå
    0.0 0.28 0.67;
    % Koralgrön
    0.18 0.54 0.34;
    % Ochre
    0.8 0.47 0.13;
    % Skiffer
    0.47 0.53 0.6;
    % Saffran
    0.96 0.77 0.19;
    % Salvia
    0.56 0.69 0.2;
    % Ljus lavendel
    0.8 0.6 0.8;
    % Marmalad
    0.89 0.47 0.20;
    % Mörk salvia
    0.24 0.4 0.22;
    % Mörk pärlemor
    0.37 0.25 0.57;
    % Ljus kaffe
    0.67 0.53 0.47;
    % Marinblå
    0.0 0.0 0.5;
    % Pastellblå
    0.64 0.79 0.8;
    % Pärla
    1 0.96 0.93;
    % Röd lera
    0.75 0.36 0.22;
    % Rosarött
    0.94 0.57 0.55;
    % Rödbrun
    0.65 0.16 0.16;
    % Sandsten
    0.8 0.69 0.45;
    % Senapsgul
    1 0.86 0.35
    ];

    % Skapa en struktur som innehåller färgerna
    colors_struct.colors = colors;

    % Spara färgerna i .mat-filen
    save(filename, 'colors_struct');

    disp(['Färgpaletten har sparats i ', filename]);
end
