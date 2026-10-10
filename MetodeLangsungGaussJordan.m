
function MetodeLangsungGaussJordan() % spl 2 - eliminasi gauss jordan
  A = [5, -1, -1, 0, 0;
       -1, 5, -1, -1, 0;
      -1, -1, 4, -1, -1;
      0, 0, 1, 4, -2;
      0, 1, -1, 1, 4];
  b = [-1; 2; 6; 2; -1];
  [n] = size(A, 1);
  Ab = [A b];

  % menampilkan matriks awal
  fprintf('Matriks awal (sebelum dieliminasi): \n');
  for i = 1:n
    fprintf('[ ');
    for j = 1:n
      fprintf('%6d ', A(i,j));
    end
    fprintf('| %6d ]\n', b(i));
  end

tic

% perhitungan
for i = 1:n
  Ab(i,:) = Ab(i,:) / Ab(i,i);

  for h = 1:n
    if h ~= i
      Ab(h,:) = Ab(h,:) - Ab(h,i)*Ab(i,:);
    end
  end
end

% hasil matriks identitas dan solusi
fprintf('Hasil eliminasi (matriks identitas dan solusi akhir dalam desimal):\n');
for i = 1:n
  fprintf('[ ');
  for j = 1:n
    fprintf('%10d ', Ab(i,j));
  end
  fprintf('| %10d ]\n', Ab(i, end));
end

% menampilkan solusi akhir
x = Ab(:, end);
fprintf('Solusi akhir dalam pecahan: \n');
for i = 1:n
  fprintf('[ %s ]\n', rats(x(i)));

end

toc
end
