<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Models\CryptoCurrency;
use App\Http\Controllers\Controller;
use App\Rules\FileTypeValidate;

class CryptoCurrencyController extends Controller
{
    public function index()
    {
        $pageTitle = "Crypto Currency List";
        $cryptos   = CryptoCurrency::orderByRaw('rank = 0, rank ASC')->searchAble(['name', 'symbol'])->paginate(getPaginate());
        return view('admin.crypto.index', compact('cryptos', 'pageTitle'));
    }

    public function save(Request $request, $id = 0)
    {
        $imageValidation = $id ? 'nullable' : 'required';

        $request->validate([
            'name'   => "required|max:40|unique:crypto_currencies,name,$id",
            'symbol' => "required|max:40|unique:crypto_currencies,symbol,$id",
            'image'  => ["$imageValidation", 'image', new FileTypeValidate(['jpg', 'jpeg', 'png'])]
        ]);

        if ($id) {
            $crypto  = CryptoCurrency::findOrFail($id);
            $message = "Crypto currency updated successfully";
        } else {
            $crypto  = new CryptoCurrency();
            $message = "Crypto currency added successfully";
        }

        $crypto->name   = $request->name;
        $crypto->symbol = strtoupper($request->symbol);

        if ($request->hasFile('image')) {
            $path = getFilePath('crypto_currency');
            $size = getFileSize('crypto_currency');
            try {
                $filename      = fileUploader($request->image, $path, $size, $crypto->image);
                $crypto->image = $filename;
            } catch (\Exception $exp) {
                $notify[] = ['error', 'Couldn\'t upload your image'];
                return back()->withNotify($notify);
            }
        }
        $crypto->save();
        $notify[] = ['success', $message];
        return back()->withNotify($notify);
    }

    public function status($id)
    {
        return CryptoCurrency::changeStatus($id);
    }
}
