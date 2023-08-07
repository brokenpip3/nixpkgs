{ lib
, buildPythonPackage
, fetchFromGitHub
, pytestCheckHook
}:

buildPythonPackage rec {
  pname = "autocommand";
  version = "2.2.2";

  src = fetchFromGitHub {
    owner = "Lucretiel";
    repo = "autocommand";
    rev = "refs/tags/${version}";
    hash = "sha256-9bv9Agj4RpeyNJvTLUaMwygQld2iZZkoLb81rkXOd3E=";
  };

  # fails with: SyntaxError: invalid syntax
  doCheck = false;

  nativeCheckInputs = [
    pytestCheckHook
  ];

  pythonImportsCheck = [
    "autocommand"
  ];

  meta = with lib; {
    description = "Autocommand turns a python function into a CLI program";
    homepage = "https://github.com/Lucretiel/autocommand";
    license = licenses.lgpl3;
    maintainers = with maintainers; [ ];
  };
}
