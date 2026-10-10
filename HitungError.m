function HitungError() % error dari metode iteratif (dibandingkan dengan hasil akhir metode langsung)
  %Hasil dari Metode Langsung (Gauss, Gauss Jordan, Dekomposisi LU)
  x_metode_langsung = [0.325444; 0.832347; 1.794872; 0.041420; -0.019724];

  %Hasil dari Metode Jacobi(nilai hampiran)
  x_jacobi = [0.325092; 0.832043; 1.794489; 0.041558; -0.019855];

  %Hasil dari Metode Gauss Seidel(nilai hampiran)
  x_seidel = [0.325682; 0.832589; 1.795058; 0.041349; -0.019720];

  n = length(x_metode_langsung);

  fprintf('Perhitungan Galat SPL\n\n');

  fprintf('Nilai Eksak (Metode Langsung):\n');
  for i = 1:n
    fprintf('  x%d = %.6f\n', i, x_metode_langsung(i));
  end
  fprintf('\n');

  fprintf('Nilai Hampiran (Metode Jacobi):\n');
  for i = 1:n
    fprintf('  x%d = %.6f\n', i, x_jacobi(i));
  end
  fprintf('\n');

  fprintf('Nilai Hampiran (Metode Gauss Seidel):\n');
  for i = 1:n
    fprintf('  x%d = %.6f\n', i, x_seidel(i));
  end
  fprintf('\n');

  % Menghitung galat absolut
  galat_absolut_jacobi = abs(x_metode_langsung - x_jacobi);
  galat_absolut_seidel = abs(x_metode_langsung - x_seidel);

  % Menghitung galat relatif
  galat_relatif_jacobi = galat_absolut_jacobi ./ abs(x_metode_langsung);
  galat_relatif_seidel = galat_absolut_seidel ./ abs(x_metode_langsung);

  % Menghitung galat relatif persentase
  galat_persen_jacobi = galat_relatif_jacobi * 100;
  galat_persen_seidel = galat_relatif_seidel * 100;

  % Menampilkan galat Jacobi
  fprintf('Galat Metode Jacobi:\n');
  for i = 1:n
    fprintf('x%d:\n', i);
    fprintf('  Galat Absolut  = %.8f\n', galat_absolut_jacobi(i));
    fprintf('  Galat Relatif  = %.8f\n', galat_relatif_jacobi(i));
    fprintf('  Galat Persen   = %.6f%%\n', galat_persen_jacobi(i));
  end
  fprintf('\n');

  % Menampilkan galat Gauss-Seidel
  fprintf('Galat Metode Gauss-Seidel:\n');
  for i = 1:n
    fprintf('x%d:\n', i);
    fprintf('  Galat Absolut  = %.8f\n', galat_absolut_seidel(i));
    fprintf('  Galat Relatif  = %.8f\n', galat_relatif_seidel(i));
    fprintf('  Galat Persen   = %.6f%%\n', galat_persen_seidel(i));
  end

end
