
function MetodeIteratifJacobi() % spl 2 - metode jacobi
  A = [5, -1, -1, 0, 0;
       -1, 5, -1, -1, 0;
       -1, -1, 4, -1, -1;
        0, 0, 1, 4, -2;
        0, 1, -1, 1, 4];

  b = [-1; 2; 6; 2; -1];

  n = length(b);
  max_iterasi = 20;
  tol = 0.001;

  % Menampilkan matriks awal
  fprintf('Matriks awal (sebelum iterasi):\n');

  for i = 1:n
    fprintf('[ ');
    for j = 1:n
      fprintf('%6g ', A(i,j));
    end
    fprintf('| %6g ]\n', b(i));
  end

  tic;
  fprintf('Metode Jacobi\n');
  fprintf('Menggunakan N = %d\n', max_iterasi);
  fprintf('Toleransi error = %f\n\n', tol);

  % Inisialisasi tebakan awal
  x_old = zeros(n, 1);
  x_new = zeros(n, 1);

  % Iterasi
  for iter = 1:max_iterasi
    for i = 1:n
      sum_val = 0;

      for j = 1:n
        if i ~= j
          sum_val = sum_val + A(i,j) * x_old(j);
        end
      end

      x_new(i) = (b(i) - sum_val) / A(i,i);
    end

    % Perhitungan error relatif
    err = norm(x_new - x_old) / max(norm(x_new), eps);

    fprintf('Iterasi ke-%d, error = %.6f\n', iter, err);

    % Periksa toleransi
    if err < tol
      fprintf('Toleransi terpenuhi pada iterasi ke-%d\n dengan error < 0.001\n', iter);
      break;
    end

    % Memperbarui nilai iterasi
    x_old = x_new;
  end

  % Menampilkan hasil
  fprintf('\nHasil akhir p, q, r, s, t:\n');

  for i = 1:n
    fprintf('   %.6f\n', x_new(i));
  end

  fprintf('\n');
  toc;
end
