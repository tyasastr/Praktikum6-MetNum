
function MetodeIteratifGaussSeidel() % spl 2 - metode gauss-seidel
  A = [5, -1, -1, 0, 0;
       -1, 5, -1, -1, 0;
      -1, -1, 4, -1, -1;
      0, 0, 1, 4, -2;
      0, 1, -1, 1, 4];
  b = [-1; 2; 6; 2; -1];
  n = length(b);
  max_iterasi = 20;
  tol = 0.001;

  % menampilkan matriks awal
  fprintf('Matriks awal (sebelum eliminasi): \n')
  for i = 1:n
    fprintf('[ ');
    for j = 1:n
      fprintf('%6g ', A(i,j));
    end
    fprintf('|%6g ]\n', b(i));
  end

tic
fprintf('Metode Gauss-Seidel\n');
fprintf('Menggunakan N = %d\n', max_iterasi);
fprintf('Toleransi error = %f\n\n', tol);

% inisialisasi tebakan awal
x = zeros(n, 1);

% iterasi
for iter = 1:max_iterasi
  x_old = x;

  for i = 1:n
    sum_val = 0;

    for j = 1:n
      if i ~= j
        sum_val = sum_val + A(i, j) * x(j);
      end
    end
    x(i) = (b(i) - sum_val) / A(i, i);
  end

  % perhitungan error relatif
  err = norm(x - x_old) / max(norm(x), eps);
  fprintf('Iterasi ke-%d, error = %.6f\n', iter, err);

  % periksa toleransi
  if err < tol
    fprintf('\nToleransi terpenuhi pada iterasi ke-%d\n dengan error < 0.001\n', iter);
    break;
  end
end

fprintf('Hasil akhir p, q, r, s, t:\n');
for i = 1:n
  fprintf('   %.6f\n', x(i));
end

toc
end
