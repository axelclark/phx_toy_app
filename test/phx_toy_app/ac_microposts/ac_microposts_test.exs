defmodule PhxToyApp.AcMicropostsTest do
  use PhxToyApp.DataCase

  alias PhxToyApp.AcMicroposts

  describe "microposts" do
    alias PhxToyApp.AcMicroposts.Micropost

    @valid_attrs %{content: "some content"}
    @update_attrs %{content: "some updated content"}
    @invalid_attrs %{content: nil}

    def micropost_fixture(attrs \\ %{}) do
      {:ok, micropost} =
        attrs
        |> Enum.into(@valid_attrs)
        |> AcMicroposts.create_micropost()

      micropost
    end

    test "list_microposts/0 returns all microposts" do
      micropost = micropost_fixture()
      assert AcMicroposts.list_microposts() == [micropost]
    end

    test "get_micropost!/1 returns the micropost with given id" do
      micropost = micropost_fixture()
      assert AcMicroposts.get_micropost!(micropost.id) == micropost
    end

    test "create_micropost/1 with valid data creates a micropost" do
      assert {:ok, %Micropost{} = micropost} = AcMicroposts.create_micropost(@valid_attrs)
      assert micropost.content == "some content"
    end

    test "create_micropost/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = AcMicroposts.create_micropost(@invalid_attrs)
    end

    test "update_micropost/2 with valid data updates the micropost" do
      micropost = micropost_fixture()
      assert {:ok, micropost} = AcMicroposts.update_micropost(micropost, @update_attrs)
      assert %Micropost{} = micropost
      assert micropost.content == "some updated content"
    end

    test "update_micropost/2 with invalid data returns error changeset" do
      micropost = micropost_fixture()
      assert {:error, %Ecto.Changeset{}} = AcMicroposts.update_micropost(micropost, @invalid_attrs)
      assert micropost == AcMicroposts.get_micropost!(micropost.id)
    end

    test "delete_micropost/1 deletes the micropost" do
      micropost = micropost_fixture()
      assert {:ok, %Micropost{}} = AcMicroposts.delete_micropost(micropost)
      assert_raise Ecto.NoResultsError, fn -> AcMicroposts.get_micropost!(micropost.id) end
    end

    test "change_micropost/1 returns a micropost changeset" do
      micropost = micropost_fixture()
      assert %Ecto.Changeset{} = AcMicroposts.change_micropost(micropost)
    end
  end
end
