{
  python3Packages,
  fetchFromGitHub,
  versionCheckHook,
  lib,
}:

python3Packages.buildPythonPackage {
  pname = "yoto-up";
  version = "unstable-2025-10-08";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "xkjq";
    repo = "yoto-up";
    rev = "26c19054c7f2045c338304b728f669c477639b01";
    hash = "sha256-9s9t155VHJj1IrTAVkSRATz0ib11qF7Ck00xlsmBMWg=";
  };

  dependencies = with python3Packages; [
    httpx
    loguru
    rich
    requests
    pydantic
    pillow
    beautifulsoup4
    mutagen
    textual
    pynput
    numpy
    matplotlib
    typer
    rapidfuzz
    nltk
    platformdirs
  ];

  # Would need to package pyloudnorm
  # optional-dependencies = {
  #   gui = with python3Packages; [
  #     flet
  #     pydub
  #     librosa
  #     pyloudnorm
  #   ];
  # };

  # Fails due to missing gui optional-dependencies
  dontCheckRuntimeDeps = true;

  build-system = with python3Packages; [
    setuptools
  ];

  pythonImportsCheck = [ "yoto_up" ];
  doCheck = false;

  nativeInstallCheckInputs = [ versionCheckHook ];

  meta = {
    description = "Tools for your Yoto player";
    mainProgram = "yoto";
    homepage = "https://xkjq.github.io/yoto-up/";
    license = with lib.licenses; [ mit ];
    maintainers = with lib.maintainers; [ iwanb ];
  };
}
