<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Models\Fiat;
use App\Http\Controllers\Controller;
use App\Rules\FileTypeValidate;

class FiatCurrencyController extends Controller
{
    public function index()
    {
        $pageTitle = "Fiat Currencies List";
        $cryptos   = Fiat::searchAble(['name', 'symbol'])->paginate(getPaginate());
        return view('admin.fiat.index', compact('cryptos', 'pageTitle'));
    }

    public function save(Request $request, $id = 0)
    {
        $imageValidation = $id ? 'nullable' : 'required';

        $request->validate([
            'name'   => "required|max:40|unique:fiats,name,$id",
            'symbol' => "required|max:40|unique:fiats,symbol,$id",
            'image'  => ["$imageValidation", 'image', new FileTypeValidate(['jpg', 'jpeg', 'png'])]
        ]);

        if ($id) {
            $crypto  = Fiat::findOrFail($id);
            $message = "Fiat currency updated successfully";
        } else {
            $crypto  = new Fiat();
            $message = "Fiat currency added successfully";
        }

        $crypto->name   = $request->name;
        $crypto->symbol = strtoupper($request->symbol);

        if ($request->hasFile('image')) {
            $path = getFilePath('fiat');
            $size = getFileSize('fiat');
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
        return Fiat::changeStatus($id);
    }
}
