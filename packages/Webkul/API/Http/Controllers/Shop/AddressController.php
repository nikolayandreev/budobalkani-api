<?php

namespace Webkul\API\Http\Controllers\Shop;

use Webkul\Core\Models\Address;
use Webkul\Customer\Repositories\CustomerAddressRepository;
use Webkul\API\Http\Resources\Customer\CustomerAddress as CustomerAddressResource;

class AddressController extends Controller
{
    /**
     * Contains current guard
     *
     * @var array
     */
    protected $guard;

    /**
     * Contains route related configuration
     *
     * @var array
     */
    protected $_config;

    /**
     * CustomerAddressRepository object
     *
     * @var \Webkul\Customer\Repositories\CustomerAddressRepository
     */
    protected $customerAddressRepository;

    /**
     * Controller instance
     *
     * @param Webkul\Customer\Repositories\CustomerAddressRepository $customerAddressRepository
     */
    public function __construct(CustomerAddressRepository $customerAddressRepository)
    {
        $this->guard = request()->has('token') ? 'api' : 'customer';

        auth()->setDefaultDriver($this->guard);

        $this->middleware('auth:' . $this->guard);

        $this->_config = request('_config');

        $this->customerAddressRepository = $customerAddressRepository;
    }

    /**
     * Get user address.
     *
     * @return \Illuminate\Http\Response
     */
    public function get()
    {
        $customer = auth($this->guard)->user();

        $addresses = $customer->addresses()->get();

        return CustomerAddressResource::collection($addresses);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function store()
    {
        $customer = auth($this->guard)->user();

        if (request()->input('address1') && !is_array(request()->input('address1'))) {
            return response()->json([
                'message' => 'address1 must be an array.',
            ]);
        }

        if (request()->input('address1')) {
            request()->merge([
                'address1' => implode(PHP_EOL, array_filter(request()->input('address1'))),
                'customer_id' => $customer->id,
            ]);
        }

        $this->validate(request(), [
            'address1' => 'string|required',
            'company' => 'string|nullable',
            'vat_id' => 'string|nullable',
            'country' => 'string|required',
            'state' => 'string|required',
            'city' => 'string|required',
            'postcode' => 'required',
            'phone' => 'required',
            'default_address' => 'boolean|nullable'
        ]);

        $customerAddress = $this->customerAddressRepository->create(request()->all());

        return response()->json([
            'message' => 'Your address has been created successfully.',
            'data' => new CustomerAddressResource($customerAddress),
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function update($id)
    {
        if (request()->input('address1') && !is_array(request()->input('address1'))) {
            return response()->json([
                'message' => 'address1 must be an array.',
            ]);
        }

        if (request()->input('address1')) {
            request()->merge([
                'address1' => implode(PHP_EOL, array_filter(request()->input('address1'))),
            ]);
        }

        $this->validate(request(), [
            'address1' => 'string|required',
            'company' => 'string|nullable',
            'vat_id' => 'string|nullable',
            'country' => 'string|required',
            'state' => 'string|required',
            'city' => 'string|required',
            'postcode' => 'required',
            'phone' => 'required',
            'default_address' => 'boolean|nullable'
        ]);

        $this->customerAddressRepository->update(request()->all(), $id);

        return response()->json([
            'message' => 'Your address has been updated successfully.',
            'data' => new CustomerAddressResource($this->customerAddressRepository->find($id)),
        ]);
    }
}