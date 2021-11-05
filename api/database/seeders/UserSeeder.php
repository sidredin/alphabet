<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->insert([
            'name' => 'Петя',
            'email' => Str::random(10).'@gmail.com',
            'password' => 655,
        ]);
        DB::table('users')->insert([
            'name' => 'Ваня',
            'email' => Str::random(10).'@gmail.com',
            'password' => 350,
        ]);
    }
}
