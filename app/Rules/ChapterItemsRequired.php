<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;
use App\Models\Webinar;

class ChapterItemsRequired implements Rule
{
    protected $webinar;

    public function __construct(Webinar $webinar)
    {
        $this->webinar = $webinar;
    }

    public function passes($attribute, $value)
    {
        // Ensure the chapters and their items are loaded
        $this->webinar->load('chapters.chapterItems');

        // Check if any chapter has no items
        $chaptersWithoutItems = $this->webinar->chapters->filter(function ($chapter) {
            return $chapter->chapterItems->isEmpty();
        });

        return $chaptersWithoutItems->isEmpty();
    }

    public function message()
    {
        return trans('update.chapter_items_required');
    }
}
