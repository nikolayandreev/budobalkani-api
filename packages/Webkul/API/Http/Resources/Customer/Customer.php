<?php

namespace Webkul\API\Http\Resources\Customer;

use Carbon\Carbon;
use Illuminate\Http\Resources\Json\JsonResource;

class Customer extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id'            => $this->id,
            'email'         => $this->email,
            'first_name'    => $this->first_name,
            'last_name'     => $this->last_name,
            'name'          => $this->name,
            'gender'        => $this->gender,
            'date_of_birth' => $this->date_of_birth,
            'date_of_birth_formatted' => $this->date_of_birth ? Carbon::createFromDate($this->date_of_birth)->translatedFormat('d F Y') : null,
            'status'        => $this->status,
            'group'         => $this->when($this->customer_group_id, new CustomerGroup($this->group)),
            'created_at'    => $this->created_at,
            'created_at_formatted'   => $this->created_at->longAbsoluteDiffForHumans(),
            'updated_at'    => $this->updated_at,
        ];
    }
}