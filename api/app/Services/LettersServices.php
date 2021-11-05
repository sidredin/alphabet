<?php

namespace App\Services;

class LettersServices
{
    public static function generateLettersList(): array
    {
        $alphabet = 'абвгдеёжзийклмнопрстуфхцчшщъыьэюя';
        if (random_int(0, 1) === 1) {
            $alphabet = mb_strtoupper($alphabet);
        };
        $letters = mb_str_split($alphabet);
        shuffle($letters);
        $mainLetter = $letters[random_int(0, count($letters) - 1)];

        return ['mainLetter' => $mainLetter, 'letters' => $letters,];
    }
}
