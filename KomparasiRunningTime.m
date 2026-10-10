
function KomparasiRunningTime() % komparasi running time kelima metode
  fprintf('Komparasi Running Time\n\n');

  metode = {'Gauss', 'Gauss-Jordan', 'Dekomposisi LU', 'Jacobi', 'Gauss-Seidel'};
  waktu = [0.00741291, 0.00899005, 0.0144751, 0.00785398, 0.00516891];

  fprintf('%-20s | %-15s\n', 'Metode', 'Running Time (s)');
  fprintf('%s\n', repmat('-', 1, 40));

  for i = 1:length(metode)
    fprintf('%-20s | %.8f\n', metode{i}, waktu (i));
  end

  fprintf('\n');

  [min_waktu, idx_min] = min(waktu);
  [max_waktu, idx_max] = max(waktu);

  fprintf('Metode tercepat: %s (%.8f detik)\n', metode{idx_min}, min_waktu);
  fprintf('Metode terlambat: %s (%.8f detik)\n', metode{idx_max}, max_waktu);
end
