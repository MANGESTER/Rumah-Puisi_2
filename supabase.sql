create table public.poems (
  id uuid primary key default gen_random_uuid(),
  title text not null check (char_length(title) between 1 and 200),
  author text not null default '' check (char_length(author) <= 100),
  category text not null default '' check (char_length(category) <= 50),
  body text not null check (char_length(body) between 1 and 20000),
  created_at timestamptz not null default now()
);

alter table public.poems enable row level security;

create policy "publik boleh baca" on public.poems
  for select using (true);

create policy "admin boleh tambah" on public.poems
  for insert to authenticated
  with check ((auth.jwt() ->> 'email') = 'EMAIL_ADMIN');

create policy "admin boleh ubah" on public.poems
  for update to authenticated
  using ((auth.jwt() ->> 'email') = 'EMAIL_ADMIN')
  with check ((auth.jwt() ->> 'email') = 'EMAIL_ADMIN');

create policy "admin boleh hapus" on public.poems
  for delete to authenticated
  using ((auth.jwt() ->> 'email') = 'EMAIL_ADMIN');

insert into public.poems (title, author, category, body, created_at) values
('Hujan Pertama','Penghuni Rumah','Alam', E'Hujan pertama jatuh di genting tua,\nmengetuk pintu tanah yang lama haus.\nAku duduk, menghitung tetes yang datang,\nseperti menghitung kabar yang tak kunjung lewat.', now()),
('Secangkir Pagi','Penghuni Rumah','Keseharian', E'Uap dari cangkir menulis namamu di udara,\nlalu lupa mengeja huruf terakhirnya.\nPagi ini aku belajar sabar\ndari gula yang larut tanpa bunyi.', now() - interval '1 second'),
('Jarak','Penghuni Rumah','Rindu', E'Kita dipisah sebentang peta,\ntetapi malam yang sama menutup mata kita.\nJika bulan adalah surat,\nkubaca ia dua kali sebelum tidur.', now() - interval '2 seconds');