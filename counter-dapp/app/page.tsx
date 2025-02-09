"use client" // This file is client side only
import { useEffect, useState } from "react";
import { MetaMaskInpageProvider } from "@metamask/providers";
import { contractABI, contractAddress } from "@/lib/contracts";
import { ethers } from "ethers";



declare global {
  interface Window {
    ethereum?: MetaMaskInpageProvider;
  }
}


export default function Home() {

  // React Hooks
  // Connected Account
  const [account, setAccount] = useState("");
  // Contract Instance
  const [contract, setContract] = useState<ethers.Contract>();
  // Counts Accounts
  const [count, setCount] = useState(0);

  const connectWallet = async () => {
    if (window.ethereum) {
      
      // Provides Metamask Wallet
      const provider = new ethers.BrowserProvider(window.ethereum);
      
      // Signer
      const signer = await provider.getSigner();


      // Get account
      try {
        const account = (await window.ethereum.request({method: "eth_requestAccounts",})) as string[];

        // Account connected? 
        if (account) {
          setAccount(account[0]);

          // Contract 
          const contractInstance = new ethers.Contract(contractAddress, contractABI, signer);
          setContract(contractInstance);
          fetchCount(contractInstance);
        }
      }
      catch (error) {
        console.error(error)
      }
    };
  };

  const fetchCount = async (contractInstance: ethers.Contract) => {
    if(contractInstance) {
      const value = await contractInstance.getCounter();
      setCount(value);
    }
  };

  // adds account
  const increment = async () => {
    if (contract) {
      const transaction = await contract.increment();
      await transaction.wait();
      fetchCount(contract);
    }
  }

  const decrement = async () => {
    if (contract) {
      const transaction = await contract.decrement();
      await transaction.wait();
      fetchCount(contract);
    }
  }

// connect wallet
  useEffect(
    () => {
      connectWallet();
    }
  );
  return (
    <>
       <div className="flex justify-center flex-col items-center h-screen">
        <button
          className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"
          onClick={connectWallet}
        >
          Connect Wallet
        </button>
        <div className="mt-5">Connected Account: {account}</div>
        <div className="mt-5">Count: {count}</div>
        <div className="flex gap-5 mt-5">
          <button
            className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"
            onClick={increment}
          >
            Increment
          </button>
          <button
            className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"
            onClick={decrement}
          >
            Decrement
          </button>
        </div>
      </div>
    </>
  );
}
