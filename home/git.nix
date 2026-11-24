{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Tom Dwyer";
        email = "tom@tomdwyer.co.uk";
      };

      init.defaultBranch = "main";

      credential."https://github.com".helper = [
        ""
        "!gh auth git-credential"
      ];

      credential."https://gist.github.com".helper = [
        ""
        "!gh auth git-credential"
      ];
    };
  };
}
