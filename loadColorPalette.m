function loaded_colors = loadColorPalette(filename)
    % Laddar färgpaletten från en sparad .mat-fil

    % Ladda färgerna från .mat-filen
    loaded_data = load(filename);

    % Hämta färgerna från den laddade datan
    loaded_colors = loaded_data.colors_struct.colors;

    disp('Färgpaletten har laddats från .mat-filen:');
end